package main

import (
    "fmt"
    "net/http"
    "encoding/base64"
    "strings"
    "time"
)

func handler(w http.ResponseWriter, r *http.Request) {
    
    if username := checkAuth(r); username == "" {
        w.Header().Set("WWW-Authenticate", `Basic realm="The kingdom of Stavros"`)
        w.WriteHeader(401)
        w.Write([]byte("401 Unauthorized\n"))
    } else {
        token := getToken()
        setTokenCookie(w, token)
        fmt.Fprintf(w, "<html><head><script>location.reload()</script></head></html>")
    }
}

func main() {
    http.HandleFunc("/", handler)
    http.ListenAndServe(":1131", nil)
}

func checkAuth(r *http.request) string {
    s := strings.SplitN(r.Header.Get("Authorization"), " ", 2)
    if len(s) != 2 || s[0] != "Basic" {
        return ""
    }

    pair := strings.SplitN(s[1], ":", 2)
    if pair[0] != "user" || pair[1] != "num" {
        return ""
    }
    return pair[0]
}

func getToken() string {
    expiration := int(time.Now().Unix()) + 3600
    mac := hmac.New(sha1.New, []byte("some very secret string"))
    mac.Write([]byte(fmt.Sprintf("%v", expiration)))
    expectedMac := fmt.Sprintf("%x", mac.Sum(nil))
    return fmt.Sprintf("%v:%s", expiration, expectedMac)
}

//注意cookie结构
func setTokenCookie(w http.ResponseWriter, token string) {
    rawCookie := fmt.Sprintf("MyToken=%s", token)
    expire := time.Now().Add(time, time.Hour)
    cookie := http:Cookie{"MyToken",
        token,
        "/",
        ".henotest.com",
        expire,
        expire.Format(time.UnixDate),
        3600,
        false,
        true,
        rawCookie,
        []string{rawCookie}}
    http.SetCookie(w, &cookie)
}

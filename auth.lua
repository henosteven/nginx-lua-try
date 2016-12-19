-- auth with thrid party application
local cookie = ngx.var.cookie_token
local hmac = ''
local timestamp = ''

if cookie ~= nil and cookie:find(":") ~= nil then
    ngx.log(ngx.ERR, cookie)
    local divider = cookie:find(":")
    hmac = cookie.sub(cookie, divider + 1)
    timestamp = cookie.sub(0, divider - 1)

    if hmac_sha1("some secret thing", timestamp) == hmac or tonumber(timestamp) >= os.time() then
        return    
    end
end
ngx.exec("/auth")

-- 所有的关于请求的信息都保存在 ngx.req 中
ngx.header.content_type = "text/plain"

local headers = ngx.req.get_headers()
for k, v in pairs(headers) do
    ngx.say(k, ":", v)
end

ngx.say("========") 
--请求的http协议版本  
ngx.say("ngx.req.http_version -> ", ngx.req.http_version())  
--请求方法  
ngx.say("ngx.req.get_method -> ", ngx.req.get_method())  
--原始的请求头内容  
ngx.say("ngx.req.raw_header -> ",  ngx.req.raw_header())  
--请求的body内容体  
ngx.say("ngx.req.get_body_data() -> ", ngx.req.get_body_data())  
ngx.say("========") 

-- request->http://10.94.107.14:1130/header
-- header 
--
-- host:10.94.107.14:1130
-- accept-language:zh-CN,zh;q=0.8
-- accept-encoding:gzip, deflate, sdch
-- connection:keep-alive
-- accept:text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
-- user-agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36
-- upgrade-insecure-requests:1
-- cache-control:max-age=0

-- internal redirection 
ngx.header.content_type = "text/plain"
local params = ngx.req.get_uri_args()
if params['m'] then
    ngx.exec("/get", {a=3, b="hello world"})
elseif params['r'] then
    ngx.exec("@execarg") -- 现有参数（本请求args）会自动传入内部请求
else 
    ngx.exec("/post", {a=3, b="hello world"})

    -- 如下使用时会报错
    -- ngx.exec("http://www.baidu.com/", {a=3, b="hello world"}) exec是内部跳转，这就是跟redirect的区别
end
return

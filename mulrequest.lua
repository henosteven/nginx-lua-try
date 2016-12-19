-- request http://10.94.107.14:1130/mulrequest?a=/test1&b=/test2
ngx.header.content_type = "text/plain"
local uri_get_args = ngx.req.get_uri_args()
local result = {}
for k, v in pairs(uri_get_args) do
    local res = ngx.location.capture(v)
    ngx.say(res.body)
end

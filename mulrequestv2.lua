-- test capture_multi
ngx.header.content_type = "text/plain"
local uri_get_args = ngx.req.get_uri_args()
local res1, res2 = ngx.location.capture_multi({{"/test1"}, {"/test2"}})
if res1.status == 200 then
    ngx.say(res1.body)
end

if res2.status == 200 then
    ngx.say(res2.body)
end

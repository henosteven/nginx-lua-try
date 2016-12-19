-- get post data
ngx.header.content_type = "text/plain"
ngx.req.read_body()
local uri_post_args = ngx.req.get_post_args()
for k, v in pairs(uri_post_args) do
    if type(v) == "table" then
        ngx.say(k, ":", table.concat(v, ","))
    else
        ngx.say(k, ":", v)
    end
end

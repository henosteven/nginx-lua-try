ngx.header.content_type = "text/plain"

ngx.say("execarg")
local uri_args = ngx.req.get_uri_args()
for k, v in pairs(uri_args) do
    if type(v) == 'table' then
        ngx.say(k, ":", table.concat(v, ','))
    else
        ngx.say(k, ":", v)
    end
end

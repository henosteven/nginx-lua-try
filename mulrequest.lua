ngx.header.content_type = "text/plain"
local uri_get_args = ngx.req.get_uri_args()
local result = {}
for k, v in pairs(uri_get_args) do
    local res = ngx.location.capture(v)
    result[k] = res.body
end

ngx.say(table.concat(result, ','))

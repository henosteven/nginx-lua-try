-- request http://10.94.107.14:1130/file?file=/reset.css??/index.css
-- 方法需要优化
function splitFilename(filestr, delimiter)
    if type(filestr) ~= "string" or string.len(filestr) == 0 then
        return
    end

    local filetable = {}
    local start = 0
    while true do
        local pos = string.find(filestr, delimiter, start, true)
        if not pos then
            break
        end
        local tmp = string.sub(filestr, start, pos-1)
        table.insert(filetable, tmp)
        start = pos + string.len(delimiter)
    end

    -- 因为最后一项值之后没有??
    table.insert(filetable, string.sub(filestr, start))
    return filetable
end

ngx.header.content_type = "text/plain"
local uri_get_args = ngx.req.get_uri_args()

for i, v in pairs(uri_get_args) do
    ngx.say(i, ":", v)
end

local filetable = splitFilename(uri_get_args["file"], "??")
local filecontent = ''
if not filetable then
    filecontent = "empty"
else
    for _, v in pairs(filetable) do
        res = ngx.location.capture(v)
        if res.status == 200 then
            filecontent = filecontent .. res.body
        end
    end
end
ngx.say(filecontent)

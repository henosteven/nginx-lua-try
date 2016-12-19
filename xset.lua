-- request http://10.94.107.14:1130/sum?i=4&j=9
-- set_by_lua_file $sum lua/xset.lua;
-- display 13
local uri_get_args = ngx.req.get_uri_args() -- table
local i = uri_get_args['i'] or 0
local j = uri_get_args['j'] or 0
return i + j

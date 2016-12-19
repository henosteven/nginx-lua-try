-- set header
ngx.header.a = "a"
ngx.header.b = {"a", "b"}
ngx.print("a", "b")
ngx.say("a", "b") -- 会在最后跟一个换行
return ngx.exit(301) -- 没有改成功

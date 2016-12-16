if ngx.var.remote_addr == '172.26.10.49' then
    ngx.log(ngx.ERR, "deny")
    ngx.exit(ngx.HTTP_FORBIDDEN)
end

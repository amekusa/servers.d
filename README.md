# servers.d
Nginx server configurations

## How to install
1. Clone the repository in `/etc/nginx`
2. Add following line inside of `http` block of `nginx.conf`
```nginx
include servers.d/*.conf;
```

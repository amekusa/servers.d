# servers.d
Nginx server setup configurations

## How to install
1. Clone the repository from `/etc/nginx`
2. Add following line into `server` block of `nginx.conf`
```nginx
include servers.d/*.conf;
```

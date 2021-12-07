# servers.d
Nginx server configurations

## Setup

1. Clone the repo in `/etc/nginx`.

```sh
cd /etc/nginx
git clone git@github.com:amekusa/servers.d.git
```

2. Include all the `.conf` files in `http` block in `/etc/nginx/nginx.conf`.

```nginx
# /etc/nginx/nginx.conf
...
http {
    ...
    include servers.d/*.conf;
}
```

3. Test & Reload Nginx.

```sh
sudo nginx -t && sudo nginx -s reload
```

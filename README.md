# servers.d
Nginx server configurations

## Setup

1. Clone the repo in `/etc/nginx`.

```sh
cd /etc/nginx
sudo git clone git@github.com:amekusa/servers.d.git
```

2. Include `enable.conf` within `http` block in `/etc/nginx/nginx.conf`.

```nginx
# /etc/nginx/nginx.conf
...
http {
    ...
    include servers.d/enable.conf;
}
```

3. Create & Edit `LIST` file.

```sh
sudo cp LIST.sample LIST
sudo nano LIST
```

4. Run `conf.sh` to generate `.conf` files for your sites.

```sh
sudo ./conf.sh
```

3. Test & Reload Nginx.

```sh
sudo ./reload.sh
```

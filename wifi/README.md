# Universtiy of Bath Eduroam WiFi

This connects you to the eduroam network. 
Certs were gathered from [https://cat.eduroam.org/](https://cat.eduroam.org/)

## Setup 

1. Use the `eduroam.env.example` to create your own `eduroam.env`

```sh
# eduroam.env
EDUROAM_IDENTITY="xxxx@bath.ac.uk" # YOUR EMAIL
EDUROAM_PASSWORD="xxxx" # YOUR PASSWORD
```

2. Move it to `/etc/NetworkManager`

```sh
sudo mv eduroam.env /etc/NetworkManager/
```

3. Ensure permissions are correct 

```sh
sudo chmod 600 /etc/NetworkManager`
```

4. Include it in your `configuration.nix` file

```nix
{ config, pkgs, lib, ... }:

{
  imports = [
    ./wifi/eduroam.nix 
  ];

```

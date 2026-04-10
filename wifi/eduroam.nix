{ pkgs, lib,... }:
let
  caCerts = lib.concatMapStrings builtins.readFile [
    ./certs/quovadis-root-ca2-g3.pem 
    ./certs/uob-intermediate-ca.pem 
    ./certs/uob-root-ca.pem
  ];
  caCertFile = pkgs.writeText "eduroam-ca.pem" caCerts;
in
{
  networking.networkmanager.ensureProfiles = {
    environmentFiles = [ "/etc/NetworkManager/eduroam.env" ];

    profiles.eduroam = {
      connection = {
        id = "eduroam";
        type = "wifi";
        autoconnect = true;
      };
      wifi = {
        mode = "infrastructure";
        ssid = "eduroam";
      };
      "wifi-security" = {
        auth-alg = "open";
        key-mgmt = "wpa-eap";
      };
      "802-1x" = {
        eap = "peap";
        identity = "$EDUROAM_IDENTITY";
        ca-cert = "${caCertFile}";
        phase2-auth = "mschapv2";
        password = "$EDUROAM_PASSWORD";
        password-flags = "0";
      };
      ipv4.method = "auto";
      ipv6 = {
        method = "auto";
        addr-gen-mode = "default";
      };
    };
  };
}

{ meta, ... }: {
  raspberry-pi-nix.board = "bcm2711";

  services.k3s = {
    enable = true;
    clusterInit = true;
    extraFlags = toString [
      "--write-kubeconfig-mode \"0644\""
      "--disable servicelb"
      "--disable traefik"
      "--disable local-storage"
    ];
  };

  networking = {
    wireless = {
      enable = true;
      networks.${meta.wifi.ssid}.psk = meta.wifi.pass;
    };
    interfaces.wlan0.useDHCP = true;
    firewall.allowedTCPPorts = [ 80 443 6443 ];
  };

  security.sudo.wheelNeedsPassword = false;

  boot.kernelParams = [ "cgroup_memory=1" "cgroup_enable=memory" ];
}

{
  raspberry-pi-nix.board = "bcm2711";

  services = {
    openssh.enable = true;
    k3s.enable = true;
  };
}

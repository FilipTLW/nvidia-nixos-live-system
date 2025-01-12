{
config,
lib,
pkgs,
modulesPath,
inputs,
...
}: {
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
  environment.systemPackages = with pkgs; [
    zed
    brave
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  boot.kernelPackages = pkgs.linuxPackages_6_11;

  services.displayManager.sddm.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.plasma6.enable = true;
    videoDrivers = [ "nvidia" ];
  };

  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = with pkgs; [
    mesa
    mesa.drivers
  ];
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  networking.wireless.enable = true;

  nixpkgs.config.allowUnfree = true;
}

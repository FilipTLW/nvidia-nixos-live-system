{
config,
lib,
pkgs,
modulesPath
inputs
...
}: {
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix") ];
  environment.systemPackages = with pkgs; [
    zed
  ];
}

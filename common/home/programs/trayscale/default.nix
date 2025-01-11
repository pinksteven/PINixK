{ pkgs, ... }:
{
  services.trayscale = {
    enable = true;
    hideWindow = true;
    package = pkgs.trayscale;
  };
}


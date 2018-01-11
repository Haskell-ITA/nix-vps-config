{ config, pkgs, ... }:
{
  nixpkgs.overlays = [ (import ./overlay) ];
}

{ config, pkgs, ... }:
{
  imports = [ ./irc-logger ];
  nixpkgs.overlays = [ (import ./overlay) ];
  services.mighttpd2.enable = true;
  services.mighttpd2.config = ''
        # Example configuration for Mighttpd 2
        Port: 80
        # IP address or "*"
        Host: *
        Index_File: index.html
        Service: 0 # 0 is HTTP only, 1 is HTTPS only, 2 is both
      '';
  services.mighttpd2.routing = ''
        [haskell-ita.it]
        / -> ${pkgs.haskell-ita-website}
        [irc.fgaz.me]
        #/archive/ -> /var/lib/irclog/archive/
        # /lograw/ -> /var/lib/irclog/irc.freenode.net/#haskell.it/
        / >> localhost:8001/
        [*]
        / -> ${pkgs.haskell-ita-website}
      '';
  networking.firewall.allowedTCPPorts = [ 80 ];
}

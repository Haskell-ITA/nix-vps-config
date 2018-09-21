{ config, lib, pkgs, ... }:

let
  irc-user = "volo-fgaz-log";
  irc-password = import ./irc-password.nix;
  irc-server = "irc.freenode.net";
  irc-channel = "#haskell-it";
in {
  users = {
    users.irc-logger = {
      description = "Irc logger user";
      group = "irc-logger";
    };
    groups.irc-logger = { };
  };
  systemd.services = {
    ircpager = {
      description = "Irc pager";
      after = [ "network-online.target" ];
      serviceConfig = {
        User = "irc-logger";
        Group = "irc-logger";
        ExecStart = ''
          ${pkgs.ircpager}/bin/ircpager /var/lib/irclog/${irc-server}/${irc-channel}/out
        '';
      };
    };

    ii-logger = {
      description = "ii irc logger";
      after = [ "network-online.target" ];
      serviceConfig = {
        ExecStartPre = "${pkgs.bash}/bin/bash ${pkgs.writeScript "ii-logger-start-pre" ''
          mkdir -p /var/lib/irclog
          chown irc-logger /var/lib/irclog
          chmod -R ugo+r /var/lib/irclog
        ''}";
        ExecStart = "${pkgs.bash}/bin/bash ${pkgs.writeScript "ii-logger-start" ''
          ${pkgs.ii}/bin/ii -i /var/lib/irclog -s ${irc-server} -p 6667 -n ${irc-user}
        ''}";
        ExecStartPost = "${pkgs.bash}/bin/bash ${pkgs.writeScript "ii-logger-start-post" ''
          ${pkgs.coreutils}/bin/sleep 13 # non si sa mai
          echo "/PRIVMSG NickServ :identify ${irc-password}" >> /var/lib/irclog/${irc-server}/in
          ${pkgs.coreutils}/bin/sleep 5 # non si sa proprio mai
          echo "/j ${irc-channel}" >> /var/lib/irclog/${irc-server}/in
        ''}";
        User = "irc-logger";
        Group = "irc-logger";
        TimeoutStartSec = 30;
        Restart = "always";
        RestartSec = "60";
      };
    };
  };
}

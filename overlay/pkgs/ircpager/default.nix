{ mkDerivation, base, data-default-class, lucid, stdenv, warp
, webpager, fetchFromGitHub
}:
mkDerivation {
  pname = "ircpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "Haskell-ITA";
    repo = "irc";
    rev = "7157ae0f5054cb6d9e6b5fcfd10a89e8311906e6";
    sha256 = "1iv09bn4c22jmgm84hlp50mj3qqb8yf8r7z1ixkc4lk16i3x5b51";
  } + "/ircpager"; # ircpager subdirectory
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base data-default-class lucid warp webpager
  ];
  license = stdenv.lib.licenses.bsd3;
}

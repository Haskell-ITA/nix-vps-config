{ mkDerivation, base, data-default-class, lucid, lib, warp
, webpager, fetchFromGitHub
}:
mkDerivation {
  pname = "ircpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "Haskell-ITA";
    repo = "irc";
    rev = "c2a713d4079d9ad725c8ec4ab6bab2a8784e3e50";
    sha256 = "sha256-rkGx8wPm4tVDj+X6QfB1t0X7M1DQ8uIaSzDWW1iSTZ8=";
  } + "/ircpager"; # ircpager subdirectory
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base data-default-class lucid warp webpager
  ];
  license = lib.licenses.bsd3;
}

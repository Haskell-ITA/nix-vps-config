{ mkDerivation, base, data-default-class, lucid, stdenv, warp
, webpager, fetchFromGitHub
}:
mkDerivation {
  pname = "ircpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "Haskell-ITA";
    repo = "irc";
    rev = "2ac5e56dd9feb7d01baebfd33da426f27f7b294b";
    sha256 = "0zgz568ah0zd7w8dr5f36w12mdpcaqy1vgywsq28yniahgyjiimr";
  } + "/ircpager"; # ircpager subdirectory
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base data-default-class lucid warp webpager
  ];
  license = stdenv.lib.licenses.bsd3;
}

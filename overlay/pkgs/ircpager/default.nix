{ mkDerivation, base, data-default-class, lucid, stdenv, warp
, webpager, fetchFromGitHub
}:
mkDerivation {
  pname = "ircpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "Haskell-ITA";
    repo = "irc";
    rev = "985e1a2f0ab95385b3abaa5319c1b22ffb4218f4";
    sha256 = "16q92lnpbk999zvg80a4735avysxwlzykwshanb0y8a3mykacq9s";
  } + "/ircpager"; # ircpager subdirectory
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base data-default-class lucid warp webpager
  ];
  license = stdenv.lib.licenses.bsd3;
}

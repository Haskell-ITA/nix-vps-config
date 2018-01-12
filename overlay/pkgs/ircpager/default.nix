{ mkDerivation, base, data-default-class, lucid, stdenv, warp
, webpager, fetchFromGitHub
}:
mkDerivation {
  pname = "ircpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "Haskell-ITA";
    repo = "irc";
    rev = "993e37e73c9341b32bb1473e2740bbba68e9683e";
    sha256 = "060m75r582v0z0672x2dpb6lk70q0nl1ss3siz9a3il4k2hhcqkq";
  } + "/ircpager"; # ircpager subdirectory
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base data-default-class lucid warp webpager
  ];
  license = stdenv.lib.licenses.bsd3;
}

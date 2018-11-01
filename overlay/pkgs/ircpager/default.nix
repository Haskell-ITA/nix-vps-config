{ mkDerivation, base, data-default-class, lucid, stdenv, warp
, webpager, fetchFromGitHub
}:
mkDerivation {
  pname = "ircpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "Haskell-ITA";
    repo = "irc";
    rev = "b2a35f6d22234e2b86191ebb0a4f7626840a238c";
    sha256 = "02ncqjajjkmakq1zms4f2dcrmz9df81bsfvxyj92hg390bf5cmfx";
  } + "/ircpager"; # ircpager subdirectory
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base data-default-class lucid warp webpager
  ];
  license = stdenv.lib.licenses.bsd3;
}

{ mkDerivation, base, bytestring, data-default-class, hashable
, http-types, lucid, stdenv, text, wai, warp, fetchFromGitHub
}:
mkDerivation {
  pname = "webpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "fgaz";
    repo = "webpager";
    rev = "f314f239328aff94af96bc6ab49964f66a44dae8";
    sha256 = "104wr5ja77i9g64ay53kiblq74spksq2h4wry884ny2xs1yn7w2r";
  };
  libraryHaskellDepends = [
    base bytestring data-default-class hashable http-types lucid text
    wai
  ];
  testHaskellDepends = [ base data-default-class warp ];
  homepage = "https://github.com/fgaz/webpager";
  description = "A generic pager for the web";
  license = stdenv.lib.licenses.bsd3;
}

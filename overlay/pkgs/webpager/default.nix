{ mkDerivation, base, bytestring, data-default-class, hashable
, http-types, lucid, stdenv, text, wai, warp, fetchFromGitHub
}:
mkDerivation {
  pname = "webpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "fgaz";
    repo = "webpager";
    rev = "7d389e59d3a6499d9a05da273a1fb0309c83bf55";
    sha256 = "1a5h1zapv9wmsrx3f2lsnsm2jh8d1l7wfz8dycz6ip5jdxx9hiq2";
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

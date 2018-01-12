{ mkDerivation, base, bytestring, data-default-class, hashable
, http-types, lucid, stdenv, text, wai, warp, fetchFromGitHub
}:
mkDerivation {
  pname = "webpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "fgaz";
    repo = "webpager";
    rev = "fa48b7f0f697a49798920286c5d510dad56271d1";
    sha256 = "1liphx02kqdws6w46hiax1axn8avaklp8562alzqfv4hzqc2vl1h";
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

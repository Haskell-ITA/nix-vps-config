{ mkDerivation, base, bytestring, data-default-class, hashable
, http-types, lucid, stdenv, text, wai, warp, fetchFromGitHub
}:
mkDerivation {
  pname = "webpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "fgaz";
    repo = "webpager";
    rev = "0d16df225a9c8f38d37f3ccd5bfca893ed6b8169";
    sha256 = "1hp8vja3b28llbwwixms3hm3rii101i67n0vry8apwmq9k5yxylp";
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

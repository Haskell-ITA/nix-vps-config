{ mkDerivation, base, bytestring, data-default-class, hashable
, http-types, lucid, stdenv, text, wai, warp, fetchFromGitHub
}:
mkDerivation {
  pname = "webpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "fgaz";
    repo = "webpager";
    rev = "f5c42269188cb716823a77558eb3c184a54fb765";
    sha256 = "1ciqaagzybmr3pyxsca5acl2icqxar0i7jfjwhna0zz864s720jr";
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

{ mkDerivation, base, bytestring, data-default-class, hashable
, http-types, lucid, lib, text, wai, warp, fetchFromGitHub
}:
mkDerivation {
  pname = "webpager";
  version = "0.1.0.0";
  src = fetchFromGitHub {
    owner = "fgaz";
    repo = "webpager";
    rev = "53bd661ca30f7a15190c9bac6f5538e973ac3067";
    sha256 = "sha256-ifLdVciunFL67uY43BljvJ5hfCYWzpg+fF81ZdWDpwQ=";
  };
  libraryHaskellDepends = [
    base bytestring data-default-class hashable http-types lucid text
    wai
  ];
  testHaskellDepends = [ base data-default-class warp ];
  homepage = "https://github.com/fgaz/webpager";
  description = "A generic pager for the web";
  license = lib.licenses.bsd3;
}

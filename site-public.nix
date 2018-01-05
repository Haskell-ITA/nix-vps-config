{ pkgs ? import <nixpkgs> {} }:

let

  site-source = pkgs.fetchFromGitHub {
    owner = "haskell-ita";
    repo = "www_haskell-ita_it_website";
    rev = "de3219697ead261919f567acd5aeaa0d946ee7b3";
    sha256 = "1isfw7rvmc2k6kvblzf623sq06fd4p11c77dnflwq5jjk4svld4i";
  };

  f = { mkDerivation, fetchFromGitHub, base, binary, blaze-html, containers
      , filepath, hakyll, stdenv, time
      }:
      mkDerivation {
        pname = "www-haskell-ita";
        version = "0.1.0.0";
        src = site-source;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = [
          base binary blaze-html containers filepath hakyll time
        ];
        license = stdenv.lib.licenses.bsd2;
      };

  site-builder = pkgs.haskellPackages.callPackage f {};

in

  (pkgs.stdenv.mkDerivation {
    name = "www-haskell-ita-public";
    src = site-source;
    # The LANG and LOCALE_ARCHIVE vars prevent an hGetContents invalid encoding error
    buildPhase = ''
      env \
        LANG=en_US.UTF-8 \
        LOCALE_ARCHIVE=${pkgs.glibcLocales}/lib/locale/locale-archive \
        ${site-builder}/bin/site build
    '';
    installPhase = ''
      cp -r _site $out
    '';
  })


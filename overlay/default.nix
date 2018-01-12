self: super:
{
  haskell-ita-website = super.callPackage ./pkgs/haskell-ita-website { };
  webpager = super.haskellPackages.callPackage ./pkgs/webpager { };
  ircpager = super.haskellPackages.callPackage ./pkgs/ircpager { };
}

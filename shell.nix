let
  nixpkgs = import (builtins.fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz") { };

  inherit (nixpkgs.lib) optionals;
in
with nixpkgs;
mkShell rec {
  buildInputs = [
    ccls
    clang_12
  ]
  ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
    libiconv
    CoreServices
  ]);
}

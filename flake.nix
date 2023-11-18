{
  description = "A Nix-flake-based C/C++ development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:

    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              # gccStdenv
              # llvmPackages_15.stdenv
              # llvmPackages_15.bintools

              # gcc
	            # clang_16
              # clang-tools_16
              cmake
            ];
          };
        });
}

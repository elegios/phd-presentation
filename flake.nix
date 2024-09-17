{
  description = "UCT Paper";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, ... } @ inputs:
    with flake-utils.lib; eachSystem allSystems (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      ocamlPackages = pkgs.ocaml-ng.ocamlPackages_5_0;
      tex = with pkgs.texlive; combine {
          inherit
            scheme-basic
            latexmk
            booktabs
            multirow
            xkeyval
            amsfonts
            pgf
            soul
            xetex
            siunitx
            semantic
            listings
            lstaddons
            algorithm2e
            amsmath
            texfot
            microtype
            acro
            translations
            beamer
            extsizes
            fontspec
            unicode-math
            lualatex-math
            firamath
            adjustbox

            inconsolata
            upquote

            memoir
            pdfpages
            pdflscape
            caption
            hyperref
            xpatch
            etoolbox
            ucs
            babel-swedish
            hyphen-swedish
            jknapltx
            subfig
            cite
            tikzmark
            ec
            cm-super
            rsfs
            enumitem
            mdframed
            needspace
            zref
            textcase
            noindentafter
            mathtools
            tikz-qtree
            doi
          ;
      };
    in rec {
      devShells.default = pkgs.mkShell {
        name = "Devshell that can build all of the things";
        buildInputs = [
          pkgs.coreutils tex pkgs.entr pkgs.lua54Packages.digestif
          pkgs.just pkgs.gdb pkgs.hyperfine pkgs.liberation_ttf
        ];
      };
    });
}

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuidInputs = [ pkgs.stow ];
  
  shellHook = ''
    echo "DOTFILES"
    echo "stow --adopt && git restore ."
  '';
}
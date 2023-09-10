{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = [ pkgs.stow ];
  
  shellHook = ''
    echo "DOTFILES"
    echo "stow --adopt && git restore ."
  '';
}
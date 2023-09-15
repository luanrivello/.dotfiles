{ pkgs ? import <nixpkgs> { } }:
pkgs.mkShell {
  name = "dotfiles";
  nativeBuildInputs = [ pkgs.stow ];
}

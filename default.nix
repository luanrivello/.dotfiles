{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuidInputs = [
    pkgs.stow
  ];
}
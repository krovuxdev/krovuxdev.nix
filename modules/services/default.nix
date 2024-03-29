{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  inherit (pkgs) lib;
  ders = map (name: "${name}") (builtins.attrNames (builtins.readDir ../services));
  dirs = builtins.filter (name: name != "default.nix") ders;
  imp = map (a: import ./${a}) dirs;
in {
  imports = imp;
}

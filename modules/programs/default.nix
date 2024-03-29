{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  inherit (pkgs) lib;
  modulesDir = ../programs;
  allDirs = builtins.readDir modulesDir;
  dirs = lib.filterAttrs (name: type: type == "directory") allDirs;
  programConfigs = lib.mapAttrs (name: type: import ./${name}) dirs;
in {
  config.programs = programConfigs;
}

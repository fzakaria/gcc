# 24.11 pin
{ pkgs ? import (fetchTarball "https://github.com/nixos/nixpkgs/archive/4e96537f163fad24ed9eb317798a79afc85b51b7.tar.gz") {} }:

let e =
  pkgs.buildFHSEnv {
    name = "gcc-git-build-env";
    targetPkgs = ps: with ps; [
      # library depends
      gmp gmp.dev
      isl
      libffi libffi.dev
      libmpc
      libxcrypt
      mpfr mpfr.dev
      xz xz.dev
      zlib zlib.dev

      # git checkout need flex as they are not complete release tarballs
      m4
      bison
      flex
      texinfo

      # test harness
      dejagnu
      autogen

      # valgrind annotations
      valgrind valgrind.dev

      # toolchain itself
      gcc
      stdenv.cc
      stdenv.cc.libc stdenv.cc.libc_dev
    ];
  };
in e.env
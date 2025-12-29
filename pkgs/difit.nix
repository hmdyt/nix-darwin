{
  pkgs,
  nodejs ? pkgs.nodejs_22,
}:

let
  nodeEnv = import ./node-env.nix {
    inherit (pkgs)
      stdenv
      lib
      runCommand
      writeTextFile
      writeShellScript
      ;
    inherit pkgs nodejs;
    python2 = pkgs.python3;
    libtool = if pkgs.stdenv.isDarwin then pkgs.darwin.cctools else null;
  };
  nodePackages = import ./node-packages.nix {
    inherit (pkgs)
      fetchurl
      nix-gitignore
      stdenv
      lib
      fetchgit
      ;
    inherit nodeEnv;
  };
in
nodePackages.difit

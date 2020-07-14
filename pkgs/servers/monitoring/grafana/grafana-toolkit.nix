{ mkYarnPackage, fetchFromGitHub, ... }:
mkYarnPackage rec {
    src = fetchFromGitHub {
      owner = "grafana";
      repo = "grafana";
      rev = "v7.0.4";
      sha256 = "16vdbxq9vhv71jjk689xx0nn3qr4s5ybzbp41dm09pppvxzibpg7";
    };
    # sourceRoot = "source/packages/grafana-toolkit";
    patches = [ ./yarn-lock.patch  "bite" ];
    packageJSON = "${src}/packages/grafana-toolkit/package.json";
    yarnLock = "${src}/yarn.lock";
    yarnNix = ./yarn.nix;
}

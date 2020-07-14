#{ stdenv, mkYarnPackage, fetchFromGitHub, nodejs, grafana, grafanaToolkit, ... }:
#
#let
#  yarnPkg = mkYarnPackage {
#    src = fetchFromGitHub {
#      owner = "simPod";
#      repo = "grafana-json-datasource";
#      rev = "6efd3f0e8dbd92f29e2eac70755fc901ec183162";
#      sha256  = "0318ipsh84fyhz0zlhmx430hpmjh3606alhjlfbf634xkfx10rvc";
#    };
#  };
#
#in
#stdenv.mkDerivation {
#  name = "grafana-json-datasource";
#  buildInputs = [ nodejs yarnPkg ];
#
#  src = fetchFromGitHub {
#    owner = "simPod";
#    repo = "grafana-json-datasource";
#    rev = "6efd3f0e8dbd92f29e2eac70755fc901ec183162";
#    sha256  = "0318ipsh84fyhz0zlhmx430hpmjh3606alhjlfbf634xkfx10rvc";
#  };
#
#  buildPhase = ''
#    ${grafanaToolkit}/bin/grafana-toolkit plugin:build
#  '';
#
#  installPhase = ''
#    mv dist/ $out/
#  '';
#}
#

{ stdenv, fetchurl, ... }:

stdenv.mkDerivation {
  name = "grafana-json-datasource";

#  grafanaProvides = {
#    datasources = ["json"];
#  };

  phases = ["unpackPhase" "installPhase"];

  src = fetchurl {
    url = "https://github.com/simPod/grafana-json-datasource/archive/v0.2.0.tar.gz";
    sha256 = "0b7p4x5d3w4vzm96hh572yqyri3iqr148gnp85sxh05dmdldavnd";
  };

  installPhase = ''
    mkdir -p $out/
    mv * $out/
  '';

}

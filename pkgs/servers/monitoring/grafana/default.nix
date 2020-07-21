{ lib, buildGoModule, fetchurl, fetchFromGitHub }:

buildGoModule rec {
  pname = "grafana";
  version = "7.1.0";

  # goPackagePath = "github.com/grafana/grafana";

  excludedPackages = [ "release_publisher" ];

  src = fetchFromGitHub {
    rev = "v${version}";
    owner = "grafana";
    repo = "grafana";
    sha256 = "15yniksm6vppd7d7y4xcnbzr26snxi3rz0vdmr35lyc5s8d3xss5";
  };

  srcStatic = fetchurl {
    url = "https://dl.grafana.com/oss/release/grafana-${version}.linux-amd64.tar.gz";
    sha256 = "13kiwp8z5c0ds57mw8dfrq1q9g24svv4pnn8v8cija0bczinqvab";
  };

  modSha256 = "0qw41vx6q3cr8nrfv5rb7j8q3k7kfds93s6q2mjxc1l4h3mkwdvl";

  postPatch = ''
    substituteInPlace pkg/cmd/grafana-server/main.go \
      --replace 'var version = "5.0.0"'  'var version = "${version}"'
  '';

  #preBuild = "export GOPATH=$GOPATH:$NIX_BUILD_TOP/go/src/${goPackagePath}/Godeps/_workspace";

  postInstall = ''
    tar -xvf $srcStatic
    mkdir -p $out/share/grafana
    mv grafana-*/{public,conf,tools} $out/share/grafana/
  '';

  meta = with lib; {
    description = "Gorgeous metric viz, dashboards & editors for Graphite, InfluxDB & OpenTSDB";
    license = licenses.asl20;
    homepage = "https://grafana.com";
    maintainers = with maintainers; [ offline fpletz willibutz globin ma27 Frostman ];
    platforms = platforms.linux;
  };
}

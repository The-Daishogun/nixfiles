{
  lib,
  appimageTools,
  fetchurl,
}: let
  pname = "hiddify";
  version = "4.1.1";

  src = fetchurl {
    url = "https://github.com/hiddify/hiddify-app/releases/download/v${version}/Hiddify-Linux-x64-AppImage.AppImage";
    hash = "sha256-6yu2wIlxuY4tCgH8W2R+KboXsWYRScyfl+2g53v1vcM=";
  };
in
  appimageTools.wrapType2 {
    inherit pname version src;
    extraPkgs = pkgs: [
      pkgs.libepoxy
      pkgs.zstd
    ];

    extraInstallCommands = ''
      mkdir -p $out/share/applications

      cat > $out/share/applications/hiddify.desktop <<EOF
      [Desktop Entry]
      Type=Application
      Name=Hiddify
      Exec=$out/bin/hiddify --no-sandbox
      Categories=Network;
      Terminal=false
      EOF
    '';

    meta = with lib; {
      description = "Hiddify proxy client";
      homepage = "https://github.com/hiddify/hiddify-app";
      platforms = ["x86_64-linux"];
    };
  }

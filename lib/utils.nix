{ pkgs }:
{
  waylandFix = pkg: binName: 
    let 
      actualBinName = if binName != null then binName else pkg.pname;
    in
    (pkgs.symlinkJoin {
      name = "${pkg.pname}-wayland";
      paths = [ pkg ];
      nativeBuildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/${actualBinName} \
          --add-flags "--enable-features=UseOzonePlatform --ozone-platform=wayland"
      '';
    }) // { 
      inherit (pkg) pname version; 
    };
}

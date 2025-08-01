{ stdenv, lib, cups, gcc }:

stdenv.mkDerivation {
  name = "rastertostar";
  src = ./.;
  
  nativeBuildInputs = [ gcc ];
  buildInputs = [ cups ];
  
  buildPhase = ''
    gcc -Wl,-rpath,${lib.getLib cups}/lib -Wall -fPIC -O2 -o rastertostar rastertostar.c -lcupsimage -lcups
  '';
  
  installPhase = ''
    mkdir -p $out/lib/cups/filter
    install -m 755 rastertostar $out/lib/cups/filter
  '';
}

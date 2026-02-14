{ lib, fetchzip, appimageTools }:

let
  version = "v2025.4";
  pname = "TrenchBroom";
in

appimageTools.wrapType2 {
  name = "${pname}-${version}";
  inherit version pname;  
  src = "${fetchzip {
    url = "https://github.com/TrenchBroom/TrenchBroom/releases/download/${version}/TrenchBroom-Linux-x86_64-${version}-Release.zip";
    hash = "sha256-qsuZ2eDvZphAza/G0qfc7ihNPnqwhwMz8fj4dlYF+FY=";
  }}/TrenchBroom.AppImage";

  meta = with lib; {
    description = "A cross-platform level editor for Quake-based games";
    homepage = "https://trenchbroom.github.io/";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
  };
}

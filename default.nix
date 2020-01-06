{ stdenv, fetchurl, cmake, fcitx, gettext, commithash }:

stdenv.mkDerivation rec {
  pname = "fcitx-table-latex";
  version = "1";

  src = fetchTarball  "https://github.com/amblafont/fcitx-table-latex-nix-src/tarball/${commithash}";

  buildInputs = [ cmake fcitx gettext ];

  preInstall = ''
   substituteInPlace tables/cmake_install.cmake \
      --replace ${fcitx} $out
  '';

  meta = with stdenv.lib; {
    isFcitxEngine = true;
    homepage      = "https://github.com/amblafont/fcitx-table-latex";
    description   = "Provides latex input method for Fcitx";
    license       = licenses.gpl3Plus;
    platforms     = platforms.linux;
    maintainers   = with maintainers; [  amblafont ];
  };

}

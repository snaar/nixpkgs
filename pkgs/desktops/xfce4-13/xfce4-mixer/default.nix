{ mkXfceDerivation, automakeAddFlags, dbus-glib, gtk2, libxfce4ui, libxfce4util, xfce4-panel, xfconf }:

mkXfceDerivation rec {
  category = "apps";
  pname = "xfce4-mixer";
  version = "4.11.0";

  sha256 = "1kiz5ysn4rqkjfzz4dvbsfj64kqqayg7bqakcys3rw28g2q5qyys";

  nativeBuildInputs = [ automakeAddFlags ];

  postPatch = ''
    automakeAddFlags panel-plugin/Makefile.am libmixer_la_CFLAGS DBUS_GLIB_CFLAGS
    automakeAddFlags xfce4-mixer/Makefile.am xfce4_mixer_CFLAGS DBUS_GLIB_CFLAGS
  '';

  buildInputs = [
    dbus-glib
    gtk2
    libxfce4ui
    libxfce4util
    xfce4-panel
    xfconf
  ];
}

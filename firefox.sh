sudo xbps-install firefox

#create system-wide conf for scrollbars and backspace to go back
sudo mkdir -p /usr/lib/firefox/defaults/pref

sudo tee /usr/lib/firefox/defaults/pref/autoconfig.js > /dev/null << 'EOF'
pref("general.config.filename", "firefox.cfg");
pref("general.config.obscure_value", 0);
EOF

sudo tee /usr/lib/firefox/firefox.cfg > /dev/null << 'EOF'
// Firefox AutoConfig - System-wide custom preferences
defaultPref("widget.gtk.overlay-scrollbars.enabled", false);
defaultPref("widget.non-native-theme.scrollbar.size.override", 18);
defaultPref("widget.non-native-theme.scrollbar.style", 4);
defaultPref("browser.backspace_action", 1);
EOF

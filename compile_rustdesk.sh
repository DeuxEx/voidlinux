;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with ‘C-x C-f’ and enter text in its buffer.



#pre-requists

xbps-install -y gstreamer1 make gcc cmake libxcb-devel libXi-devel openssl openssl-devel curl cargo pkg-config glib-devel pkg-config wget glib libvpx opus zip git wget nasm yasm clang xdotool cargo gst-plugins-bad1 gstreamer1-devel-1.26.5_1 libsndio gtk+3-devel-3.24.50_1 gstreamer1-devel-32bit-1.26.5_1 gstreamermm-devel-32bit-1.10.0_3 pam-devel-1.5.3_4 libvpx-devel-1.13.1_1 libaom-devel-3.8.1_2 libsharpyuv-32bit-1.6.0_3 libsharpyuv-devel-32bit-1.6.0_3 opus-devel-1.6_1 opus-devel-32bit-1.6_1 opusfile-32bit-0.12_3 opusfile-devel-32bit-0.12_3 libpulseaudio-32bit-16.1_2



git clone --recurse-submodules https://github.com/rustdesk/rustdesk

cd rustdesk

mkdir -p target/debug

wget https://raw.githubusercontent.com/c-smile/sciter-sdk/master/bin.lnx/x64/libsciter-gtk.so
mv libsciter-gtk.so target/debug



#compiling
VCPKG_ROOT=$HOME/vcpkg cargo run





  120  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  121  source $HOME/.cargo/env 








  170  VCPKG_ROOT=$HOME/vcpkg cargo run
  175  pkg-config
  176  pkg-config --mod-version gstreamer-1.0
  177  pkg-config --modversion gstreamer-1.0
  178  pkg-config --cflags gstreamer-1.0



  199  curl -LO https://rustdesk.com/builds/rustdesk-latest-x86_64-unknown-linux-gnu.tar.gz


  202  tar xzf rustdesk-latest-x86_64-unknown-linux-gnu.tar.gz

  208  cp /home/void/Downloads/rustdesk-1.4.4.tar.gz .


  211  tar xzf rustdesk-1.4.4.tar.gz 
  213  cd rustdesk-1.4.4

  219  cp rustdesk /usr/local/bin/



  232  ./build.py


  246  ./build.rs

  248  cargo
  249  cargo update
  253  sudo cargo update




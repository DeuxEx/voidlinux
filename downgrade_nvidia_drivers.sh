  300  ls /var/cache/xbps/nvidia*
  303  xdowngrade /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps
  304  xbps-install /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps
  305  xbps-rindex -a /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps
  306  xbps-install -R /var/cache/xbps/ -f nvidia-580.105.08_1
  307  xbps-rindex -a /var/cache/xbps/nvidia-libs-580.105.08_1.xbps
  308  xbps-rindex -a /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps
  309  xbps-rindex -a /var/cache/xbps/nvidia-libs-580.105.08_1.x86_64.xbps
  310  xbps-install -R /var/cache/xbps/ -f nvidia-580.105.08_1
  311  xbps-rindex -a /var/cache/xbps/nvidia-gtklibs-580.105.08_1.x86_64.xbps
  312  xbps-install -R /var/cache/xbps/ -f nvidia-580.105.08_1
  313  xbps-rindex -a /var/cache/xbps/nvidia-dkms-580.105.08_1.x86_64.xbps
  314  xbps-install -R /var/cache/xbps/ -f nvidia-580.105.08_1
  315  xbps-rindex -a /var/cache/xbps/nvidia-firmware-580.105.08_1.x86_64.xbps
  316  xbps-install -R /var/cache/xbps/ -f nvidia-580.105.08_1







xbps-rindex -a /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps

xbps-rindex -a /var/cache/xbps/nvidia-libs-580.105.08_1.x86_64.xbps

xbps-rindex -a /var/cache/xbps/nvidia-dkms-580.105.08_1.x86_64.xbps

xbps-rindex -a /var/cache/xbps/nvidia-firmware-580.105.08_1.x86_64.xbps

index: 5 packages registered.
[root@deux-void-gamingrig void]# xbps-install -R /var/cache/xbps/ -f nvidia-580.105.08_1

Name            Action    Version           New version            Download size
nvidia-libs     downgrade 580.119.02_1      580.105.08_1           - 
nvidia-gtklibs  downgrade 580.119.02_1      580.105.08_1           - 
nvidia-dkms     downgrade 580.119.02_1      580.105.08_1           - 
nvidia-firmware downgrade 580.119.02_1      580.105.08_1           - 
nvidia          install   -                 580.105.08_1           - 

Size required on disk:         895MB
Space available on disk:        84GB

Do you want to continue? [Y/n] y

[*] Verifying package integrity
nvidia-libs-580.105.08_1: verifying SHA256 hash...
nvidia-gtklibs-580.105.08_1: verifying SHA256 hash...
nvidia-dkms-580.105.08_1: verifying SHA256 hash...
nvidia-firmware-580.105.08_1: verifying SHA256 hash...
nvidia-580.105.08_1: verifying SHA256 hash...

[*] Collecting package files
nvidia-libs-580.105.08_1: collecting files...
nvidia-libs-580.119.02_1: collecting files...
nvidia-gtklibs-580.105.08_1: collecting files...
nvidia-gtklibs-580.119.02_1: collecting files...
nvidia-dkms-580.105.08_1: collecting files...
nvidia-dkms-580.119.02_1: collecting files...
nvidia-firmware-580.105.08_1: collecting files...
nvidia-firmware-580.119.02_1: collecting files...
nvidia-580.105.08_1: collecting files...

[*] Unpacking packages
Removing DKMS module 'nvidia-580.119.02' for kernel-6.12.63_1... done.
Removing DKMS module 'nvidia-580.119.02' for kernel-6.12.64_1... done.
Removing DKMS module 'nvidia-580.119.02' for kernel-6.12.65_1... done.
nvidia-libs-580.119.02_1: updating to 580.105.08_1 ...
nvidia-libs-580.105.08_1: unpacking ...
nvidia-gtklibs-580.119.02_1: updating to 580.105.08_1 ...
nvidia-gtklibs-580.105.08_1: unpacking ...
nvidia-dkms-580.119.02_1: updating to 580.105.08_1 ...
nvidia-dkms-580.105.08_1: unpacking ...
nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_maxwell_access_counvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_turing_access_counnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-modeset/nvidia-modeset-os-nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/blackwell/gb100/nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_peer_identity_mappnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/ampere/ga100/devnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_gpu_non_replayablenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_gpu_non_replayablenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/hal/library/cryptlib/cryptnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-modeset/nv-modeset-kernel.nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/ampere/ga100/devnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/hopper/gh100/devnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/pascal/gp100/devnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/turing/tu102/devnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-drm/nvidia-drm-gem-nvkms-mnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-drm/nvidia-drm-gem-nvkms-mnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/maxwell/gm107/denvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/volta/gv100/dev_nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_fault_buffer_flushnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-drm/nvidia-drm-gem-user-menvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-drm/nvidia-drm-gem-user-menvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/hopper/gh100/devnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/pascal/gp100/devnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/turing/tu102/devnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_blackwell_fault_bunvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_blackwell_fault_bunvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/pascal/gp100/devnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/volta/gv100/dev_nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_gpu_replayable_faunvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_gpu_replayable_faunvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_range_group_tree_tnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-modeset/nvidia-modeset-linnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/hwref/volta/gv100/dev_nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_maxwell_fault_buffnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_range_allocator_tenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/common/inc/nv-kernel-interface-apnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/internal/libspdm_lib_confinvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-drm/nvidia-drm-os-interfacnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-drm/nvidia-drm-os-interfacnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-modeset/nvidia-modeset.Kbunvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-peermem/nvidia-peermem.Kbunvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/nvidia-uvm-sources.Kbunvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_ampere_fault_buffenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_ampere_fault_buffenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_gpu_access_counternvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_gpu_access_counternvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_hopper_fault_buffenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_hopper_fault_buffenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_pascal_fault_buffenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_pascal_fault_buffenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_thread_context_tesnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_turing_fault_buffenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_turing_fault_buffenvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_va_range_device_p2nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/common/inc/nv_speculation_barriernvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/libspdm_internal_crypt_libnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia/nvspdm_cryptlib_extensionsnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-drm/nvidia-dma-resv-helpernvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-drm/nvidia-drm-gem-dma-bufnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-drm/nvidia-drm-gem-dma-bufnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_gpu_semaphore_testnvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_volta_fault_buffernvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_volta_fault_buffernvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/nv-kthread-q-selftest.nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_populate_pageable.nvidia-dkms-580.105.08_1: removed obsolete entry: ./usr/src/nvidia-580.119.02/nvidia-uvm/uvm_populate_pageable.nvidia-firmware-580.119.02_1: updating to 580.105.08_1 ...
nvidia-firmware-580.105.08_1: unpacking ...
nvidia-580.105.08_1: unpacking ...

[*] Configuring unpacked packages
nvidia-libs-580.105.08_1: configuring ...
nvidia-libs-580.105.08_1: updated successfully.
nvidia-gtklibs-580.105.08_1: configuring ...
nvidia-gtklibs-580.105.08_1: updated successfully.
nvidia-dkms-580.105.08_1: configuring ...
Added DKMS module 'nvidia-580.105.08'.
Skipping kernel-6.12.11_1. kernel-headers package not installed...
Building DKMS module 'nvidia-580.105.08' for kernel-6.12.63_1... done.
Installing DKMS module 'nvidia-580.105.08' for kernel-6.12.63_1... done.
Building DKMS module 'nvidia-580.105.08' for kernel-6.12.64_1... done.
Installing DKMS module 'nvidia-580.105.08' for kernel-6.12.64_1... done.
Building DKMS module 'nvidia-580.105.08' for kernel-6.12.65_1... done.
Installing DKMS module 'nvidia-580.105.08' for kernel-6.12.65_1... done.
Regenerating initramfs images using kernel hook 20-initramfs
dracut[I]: Executing: /usr/bin/dracut --force boot/initramfs-6.12.11_1.img 6.12.11_1
dracut[I]: *** Including module: dash ***
dracut[I]: *** Including module: i18n ***
dracut[I]: *** Including module: drm ***
dracut[I]: *** Including module: btrfs ***
dracut[I]: *** Including module: crypt ***
dracut[I]: *** Including module: dm ***
dracut[I]: *** Including module: kernel-modules ***
dracut[I]: *** Including module: kernel-modules-extra ***
dracut[I]: *** Including module: lvm ***
dracut[I]: *** Including module: mdraid ***
dracut[I]: *** Including module: nvdimm ***
dracut[I]: *** Including module: qemu ***
dracut[I]: *** Including module: hwdb ***
dracut[I]: *** Including module: lunmask ***
dracut[I]: *** Including module: resume ***
dracut[I]: *** Including module: rootfs-block ***
dracut[I]: *** Including module: terminfo ***
dracut[I]: *** Including module: udev-rules ***
dracut[I]: *** Including module: virtiofs ***
dracut[I]: *** Including module: usrmount ***
dracut[I]: *** Including module: base ***
dracut[I]: *** Including module: fs-lib ***
dracut[I]: *** Including module: shell-interpreter ***
dracut[I]: *** Including module: shutdown ***
dracut[I]: *** Including modules done ***
dracut[I]: *** Installing kernel module dependencies ***
dracut[I]: *** Installing kernel module dependencies done ***
dracut[I]: *** Resolving executable dependencies ***
dracut[I]: *** Resolving executable dependencies done ***
dracut[I]: *** Hardlinking files ***
dracut[I]: *** Hardlinking files done ***
dracut[I]: *** Generating early-microcode cpio image ***
dracut[I]: *** Constructing AuthenticAMD.bin ***
dracut[I]: *** Store current command line parameters ***
dracut[I]: *** Stripping files ***
dracut[I]: *** Stripping files done ***
dracut[I]: *** Creating image file '/boot/initramfs-6.12.11_1.img.tmp' ***
dracut[I]: Using auto-determined compression method 'gzip'
dracut[I]: *** Creating initramfs image file '/boot/initramfs-6.12.11_1.img.tmp' done ***
dracut[I]: *** Moving image file '/boot/initramfs-6.12.11_1.img.tmp' to '/boot/initramfs-6.12.11_1.img' ***
dracut[I]: *** Moving image file '/boot/initramfs-6.12.11_1.img.tmp' to '/boot/initramfs-6.12.11_1.img' done ***
dracut[I]: Executing: /usr/bin/dracut --force boot/initramfs-6.12.63_1.img 6.12.63_1
dracut[I]: *** Including module: dash ***
dracut[I]: *** Including module: i18n ***
dracut[I]: *** Including module: drm ***
dracut[I]: *** Including module: btrfs ***
dracut[I]: *** Including module: crypt ***
dracut[I]: *** Including module: dm ***
dracut[I]: *** Including module: kernel-modules ***
dracut[I]: *** Including module: kernel-modules-extra ***
dracut[I]: *** Including module: lvm ***
dracut[I]: *** Including module: mdraid ***
dracut[I]: *** Including module: nvdimm ***
dracut[I]: *** Including module: qemu ***
dracut[I]: *** Including module: hwdb ***
dracut[I]: *** Including module: lunmask ***
dracut[I]: *** Including module: resume ***
dracut[I]: *** Including module: rootfs-block ***
dracut[I]: *** Including module: terminfo ***
dracut[I]: *** Including module: udev-rules ***
dracut[I]: *** Including module: virtiofs ***
dracut[I]: *** Including module: usrmount ***
dracut[I]: *** Including module: base ***
dracut[I]: *** Including module: fs-lib ***
dracut[I]: *** Including module: shell-interpreter ***
dracut[I]: *** Including module: shutdown ***
dracut[I]: *** Including modules done ***
dracut[I]: *** Installing kernel module dependencies ***
dracut[I]: *** Installing kernel module dependencies done ***
dracut[I]: *** Resolving executable dependencies ***
dracut[I]: *** Resolving executable dependencies done ***
dracut[I]: *** Hardlinking files ***
dracut[I]: *** Hardlinking files done ***
dracut[I]: *** Generating early-microcode cpio image ***
dracut[I]: *** Constructing AuthenticAMD.bin ***
dracut[I]: *** Store current command line parameters ***
dracut[I]: *** Stripping files ***
dracut[I]: *** Stripping files done ***
dracut[I]: *** Creating image file '/boot/initramfs-6.12.63_1.img.tmp' ***
dracut[I]: Using auto-determined compression method 'gzip'
dracut[I]: *** Creating initramfs image file '/boot/initramfs-6.12.63_1.img.tmp' done ***
dracut[I]: *** Moving image file '/boot/initramfs-6.12.63_1.img.tmp' to '/boot/initramfs-6.12.63_1.img' ***
dracut[I]: *** Moving image file '/boot/initramfs-6.12.63_1.img.tmp' to '/boot/initramfs-6.12.63_1.img' done ***
dracut[I]: Executing: /usr/bin/dracut --force boot/initramfs-6.12.64_1.img 6.12.64_1
dracut[I]: *** Including module: dash ***
dracut[I]: *** Including module: i18n ***
dracut[I]: *** Including module: drm ***
dracut[I]: *** Including module: btrfs ***
dracut[I]: *** Including module: crypt ***
dracut[I]: *** Including module: dm ***
dracut[I]: *** Including module: kernel-modules ***
dracut[I]: *** Including module: kernel-modules-extra ***
dracut[I]: *** Including module: lvm ***
dracut[I]: *** Including module: mdraid ***
dracut[I]: *** Including module: nvdimm ***
dracut[I]: *** Including module: qemu ***
dracut[I]: *** Including module: hwdb ***
dracut[I]: *** Including module: lunmask ***
dracut[I]: *** Including module: resume ***
dracut[I]: *** Including module: rootfs-block ***
dracut[I]: *** Including module: terminfo ***
dracut[I]: *** Including module: udev-rules ***
dracut[I]: *** Including module: virtiofs ***
dracut[I]: *** Including module: usrmount ***
dracut[I]: *** Including module: base ***
dracut[I]: *** Including module: fs-lib ***
dracut[I]: *** Including module: shell-interpreter ***
dracut[I]: *** Including module: shutdown ***
dracut[I]: *** Including modules done ***
dracut[I]: *** Installing kernel module dependencies ***
dracut[I]: *** Installing kernel module dependencies done ***
dracut[I]: *** Resolving executable dependencies ***
dracut[I]: *** Resolving executable dependencies done ***
dracut[I]: *** Hardlinking files ***
dracut[I]: *** Hardlinking files done ***
dracut[I]: *** Generating early-microcode cpio image ***
dracut[I]: *** Constructing AuthenticAMD.bin ***
dracut[I]: *** Store current command line parameters ***
dracut[I]: *** Stripping files ***
dracut[I]: *** Stripping files done ***
dracut[I]: *** Creating image file '/boot/initramfs-6.12.64_1.img.tmp' ***
dracut[I]: Using auto-determined compression method 'gzip'
dracut[I]: *** Creating initramfs image file '/boot/initramfs-6.12.64_1.img.tmp' done ***
dracut[I]: *** Moving image file '/boot/initramfs-6.12.64_1.img.tmp' to '/boot/initramfs-6.12.64_1.img' ***
dracut[I]: *** Moving image file '/boot/initramfs-6.12.64_1.img.tmp' to '/boot/initramfs-6.12.64_1.img' done ***
dracut[I]: Executing: /usr/bin/dracut --force boot/initramfs-6.12.65_1.img 6.12.65_1
dracut[I]: *** Including module: dash ***
dracut[I]: *** Including module: i18n ***
dracut[I]: *** Including module: drm ***
dracut[I]: *** Including module: btrfs ***
dracut[I]: *** Including module: crypt ***
dracut[I]: *** Including module: dm ***
dracut[I]: *** Including module: kernel-modules ***
dracut[I]: *** Including module: kernel-modules-extra ***
dracut[I]: *** Including module: lvm ***
dracut[I]: *** Including module: mdraid ***
dracut[I]: *** Including module: nvdimm ***
dracut[I]: *** Including module: qemu ***
dracut[I]: *** Including module: hwdb ***
dracut[I]: *** Including module: lunmask ***
dracut[I]: *** Including module: resume ***
dracut[I]: *** Including module: rootfs-block ***
dracut[I]: *** Including module: terminfo ***
dracut[I]: *** Including module: udev-rules ***
dracut[I]: *** Including module: virtiofs ***
dracut[I]: *** Including module: usrmount ***
dracut[I]: *** Including module: base ***
dracut[I]: *** Including module: fs-lib ***
dracut[I]: *** Including module: shell-interpreter ***
dracut[I]: *** Including module: shutdown ***
dracut[I]: *** Including modules done ***
dracut[I]: *** Installing kernel module dependencies ***
dracut[I]: *** Installing kernel module dependencies done ***
dracut[I]: *** Resolving executable dependencies ***
dracut[I]: *** Resolving executable dependencies done ***
dracut[I]: *** Hardlinking files ***
dracut[I]: *** Hardlinking files done ***
dracut[I]: *** Generating early-microcode cpio image ***
dracut[I]: *** Constructing AuthenticAMD.bin ***
dracut[I]: *** Store current command line parameters ***
dracut[I]: *** Stripping files ***
dracut[I]: *** Stripping files done ***
dracut[I]: *** Creating image file '/boot/initramfs-6.12.65_1.img.tmp' ***
dracut[I]: Using auto-determined compression method 'gzip'
dracut[I]: *** Creating initramfs image file '/boot/initramfs-6.12.65_1.img.tmp' done ***
dracut[I]: *** Moving image file '/boot/initramfs-6.12.65_1.img.tmp' to '/boot/initramfs-6.12.65_1.img' ***
dracut[I]: *** Moving image file '/boot/initramfs-6.12.65_1.img.tmp' to '/boot/initramfs-6.12.65_1.img' done ***
nvidia-dkms-580.105.08_1: updated successfully.
nvidia-firmware-580.105.08_1: configuring ...
nvidia-firmware-580.105.08_1: updated successfully.
nvidia-580.105.08_1: configuring ...
Updating MIME database...
nvidia-580.105.08_1: installed successfully.

0 downloaded, 1 installed, 4 updated, 5 configured, 0 removed, 0 on hold.
[root@deux-void-gamingrig void]# 


To prevent a package from being updated during a system update, use xbps-pkgdb(1):

# xbps-pkgdb -m hold <package>
The hold can be removed with:

# xbps-pkgdb -m unhold <package>

xbps-rindex -a /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-libs-580.105.08_1.xbps
xbps-rindex -a /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-libs-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-gtklibs-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-dkms-580.105.08_1.x86_64.xbps
xbps-rindex -a /var/cache/xbps/nvidia-firmware-580.105.08_1.x86_64.xbps


xbps-pkgdb -m hold /var/cache/xbps/nvidia-580.105.08_1.x86_64.xbps
xbps-pkgdb -m hold 
xbps-pkgdb -m hold 
xbps-pkgdb -m hold 
xbps-pkgdb -m hold 
xbps-pkgdb -m hold 
xbps-pkgdb -m hold 




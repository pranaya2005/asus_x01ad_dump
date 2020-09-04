#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:41b5ca7fe68559c7ed9cd1d184a8fa07a191eace; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:4562dab4aeb21a76fbc5fe759228b260139ed525 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:41b5ca7fe68559c7ed9cd1d184a8fa07a191eace && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

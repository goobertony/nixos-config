{
  # Bootloader.
  
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  # Setup keyfile
  boot.initrd.secrets = {
    "/boot/crypto_keyfile.bin" = null;
  };

  boot.loader.grub.enableCryptodisk = true;

  boot.initrd.luks.devices."luks-e29861f0-9e15-4cd4-a5a2-c3ba17cafee2".keyFile = "/boot/crypto_keyfile.bin";
}

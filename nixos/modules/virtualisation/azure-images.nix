let self = {
  "16.09" = "https://nixos.blob.core.windows.net/images/nixos-image-16.09.1694.019dcc3-x86_64-linux.vhd";

  "20.03" = "https://nixopsstorage.blob.core.windows.net/nixops-7d5e0ebd-c480-11ea-b20d-0242ad3ebca8-vhds/azure-image.vhd";

  latest = self."20.03";
}; in self

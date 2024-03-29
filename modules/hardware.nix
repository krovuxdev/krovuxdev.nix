{pkgs, ...}: {
  services.xserver.videoDrivers = ["amdgpu"];
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      amdvlk
      rocmPackages.clr.icd
    ];
    extraPackages32 = with pkgs; [driversi686Linux.amdvlk];
  };
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    postgresql
    libpq
  ];
}

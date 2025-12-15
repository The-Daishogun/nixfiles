{...}: {
  virtualisation.containers.enable = true;
  virtualisation = {
    docker = {
      enable = true;

      logDriver = "local";
      daemon = {
        settings = {
          registry-mirrors = [
            "https://registry.docker.ir"
          ];
          default-address-pools = [
            {
              base = "10.200.0.0/16";
              size = 24;
            }
          ];
        };
      };
      autoPrune = {
        enable = true;
        flags = [
          "--all"
        ];
        persistent = true;
      };
    };
  };
}

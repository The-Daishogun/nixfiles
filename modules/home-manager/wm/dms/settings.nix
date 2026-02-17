{...}:{
  programs.dank-material-shell = {

  settings = {
      theme = "dark";
      dynamicTheming = true;
      niriLayoutGapsOverride= 22;
      niriLayoutRadiusOverride= -1;
      niriLayoutBorderSize= 2;
    };
    session = {
      isLightMode = false;
    };
    clipboardSettings = {
      maxHistory = 100;
      maxEntrySize = 5242880;
      autoClearDays = 7;
      clearAtStartup = false;
      disabled = false;
      disableHistory = false;
      disablePersist = true;
    };
  };
}
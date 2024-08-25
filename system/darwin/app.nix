{
  # Homebrew has to be installed first.
  # This installs system-wide packages and Mac App Store apps.
  homebrew = {
    enable = true;
    onActivation = {
      #   cleanup = "uninstall";
    };

    brews = [
    ];

    casks = map
      (x: {
        name = x;
        greedy = true;
        args = {
          no_quarantine = true;
        };
      }) [
    ];

    taps = [
    ];

    masApps = { };
  };
}

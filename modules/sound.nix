{

  #hardware.pulseaudio.enable = true;
  #rsound.enable = true;

  # rtkit is optional but recommended
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    wireplumber.extraConfig = {
      "discord-block-volume" = {
        "policy-node.rules" = [
          {
            matches = [
              { "application.name" = "~Discord.*"; }
            ];
            actions = {
              "update-props" = {
                "node.quirks" = "block-source-volume";
              };
            };
          }
        ];
      };
    };
    alsa.enable = true;
    #   alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  users.users.tonii.extraGroups = [ "audio" ];

}

{ pkgs, ... }:

{
  musnix.enable = true;
  users.users.tonii.extraGroups = [ "audio" ]; #
  

  # Packages
  nixpkgs.config.allowUnfree = true; # Required for REAPER, Bitwig, etc.
  environment.systemPackages = with pkgs; [
    # --- Utilities & Routing ---
    qpwgraph            # Visual patchbay for PipeWire
    pwvucontrol         # Fallback for Pro Audio profile selection
    # easyeffects         # System-wide real-time EQ and effects
    
    # --- DAWs ---
    # ardour
    reaper
    renoise
    milkytracker
    # --- Plugin Hosts ---
    carla               # Modular plugin host / pedalboard, supports Windows VST via yabridge

    # --- Standalone Guitar Processors ---
    guitarix

    # --- Plugins (LV2/CLAP) ---
    neural-amp-modeler-lv2  # NAM: loads .nam files from tone3000.com
    proteus                # Neural network modeling (LSTM) by GuitarML
    lsp-plugins            # Includes latency meter, compressors, IR loader
    calf
    dragonfly-reverb
    gxplugins-lv2
    kapitonov-plugins-pack # Profile-based amp models (KPP)
    chow-centaur           # Klon Centaur emulation
    chow-phaser

    vital
    bespokesynth

    # --- Practice & Learning ---
    # hydrogen

    # --- Windows VST Compatibility ---
    yabridge
    yabridgectl 
    wineWow64Packages.yabridge  
  ];
}


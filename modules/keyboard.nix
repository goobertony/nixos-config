{config, pkgs, ...}: {
   i18n.inputMethod = {
     type = "fcitx5";
     enable = true;
     fcitx5.addons = with pkgs; [
       fcitx5-gtk             # alternatively, kdePackages.fcitx5-qt
       fcitx5-chinese-addons  # table input method support
       fcitx5-nord            # a color theme
     ];
   };
  services.libinput = {
    enable = true;
    mouse = {
      # buttonMapping = "1 2 3 4 5 6 7 8 9 1 2 2";
      scrollMethod = "button";
      scrollButton = 12;
       };
  };
  services.kanata = {
enable = true;
    keyboards = {
      keyboard = {
        devices = [];
        extraDefCfg ="process-unmapped-keys yes concurrent-tap-hold true";
        config = ''
         
          (defsrc
            grv  1    2    3    4    5    6    7    8    9    0    -    =
          tab  q    w    e    r    t    y    u    i    o    p    [    ]
          caps a    s    d    f    g    h    j    k    l    ;    '
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc rmeta            ralt menu rctl
          )

          
          (deflayer birdie
            grv  1    2    3    4    5    6    7    8    9    0    -    =
          tab  \    l    p    d    f    '    w    o    u    ;    [    ]
          @nav t    s    n    h    m    g    c    a    i    e    /
          lsft v    z    b    k    q    x    y    .    ,    j    rsft
          lctl lmet lalt           r spc           ralt menu @qwr
          )
          (deflayer qwerty
            grv  1    2    3    4    5    6    7    8    9    0    -    =
          tab  q    w    e    r    t    y    u    i    o    p    [    ]
          @nav a    s    d    f    g    h    j    k    l    ;    '
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc rpt           ralt menu @brd
          )
          
          (deflayer navigation
            _  _    _    _    _    _    _    _    _    _    _    _    _
          _  _    _   _     _    _    _    mlft    mrgt    mmid    _    _    _
          _  _    _    mmid    mlft    mrgt    _    left    down    up    right    _
          _  _    _    _    @mwu    @mwd    _    _    _    _    _    _
          _ _ _           _  _          _ _ _
          )
          
          (defzippy
           ~/zippy.txt
          )

          (defalias
            ;; layers
          
          qwr (layer-switch qwerty)
          brd (layer-switch birdie)
          nav (layer-while-held navigation)

            ;; mouse control for nav layer
          mup (movemouse-up 2 1)
	        mdn (movemouse-down 2 1)
          mlt (movemouse-left 2 1)
          mrt (movemouse-right 2 1)
          mwu (mwheel-up 75 120)
          mwd (mwheel-down 75 120)
	       slw (movemouse-speed 25)

          
          ;; in case you want shorthand for other mods
        ;;  LTq (layer-toggle qwerty)
        ;;  met (multi lmet @LTq)
      	;;  ctrl (multi lmet @LTq)

         ;; magic key (not used in layout)
          * (switch
         ((key-history w 1)) h break
         ((key-history y 1)) , break
         ((key-history u 1)) e break
         ((key-history g 1)) s break
         ((key-history ' 1)) r break
         () rpt break)
          )
       '';
      };
    };
  };
}

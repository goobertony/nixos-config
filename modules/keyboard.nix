{...}: {
  services.kanata = {
enable = true;
    keyboards = {
      keyboard = {
        devices = [];
        extraDefCfg ="process-unmapped-keys yes concurrent-tap-hold true";
        config = ''
         
          (defchordsv2
          (a s)  c     200 all-released ()   
          )
         
         ;; (defsrc
         ;;   grv  1    2    3    4    5    6    7    8    9    0    -    =
         ;; tab  q    w    e    r    t    y    u    i    o    p    [    ]
         ;; caps a    s    d    f    g    h    j    k    l    ;    '
         ;; lsft z    x    c    v    b    n    m    ,    .    /    rsft
         ;; lctl lmet lalt           spc            ralt menu rctl
         ;; )

          (defsrc
            grv  1    2    3    4    5    6    7    8    9    0    -    =
          tab  f    d    l    g    v    q    r    u    o    ,    [    ]
          caps s    t    h    c    y    j    n    e    a    i    /
          lsft z    k    m    p    w    x    b    ;    '    .    rsft
          lctl lmet lalt           spc  rmet          ralt menu rctl
          )
          
          (deflayer inqwerted
            grv  1    2    3    4    5    6    7    8    9    0    -    =
         tab  t    r    e    w    q    p    o    i    u    y    [    ]
         @nav g    f    d    s    a    ;    l    k    j    h    '
         lsft b    v    c    x    z    /    .    ,    m    n    rsft
          lctl met lalt           spc  rpt         @rin menu rctl
          )
 
          (deflayer rain
            grv  1    2    3    4    5    6    7    8    9    0    -    =
          tab  f    d    l    g    v    q    r    u    o    ,    [    ]
          @nav s    t    h    c    y    j    n    e    a    i    /
          lsft z    k    m    p    w    x    b    ;    '    .    rsft
          lctl lmet lalt           spc rpt           @qwr menu rctl
          )

          (deflayer qwerty
            grv  1    2    3    4    5    6    7    8    9    0    -    =
          tab  q    w    e    r    t    y    u    i    o    p    [    ]
          @nav a    s    d    f    g    h    j    k    l    ;    '
          lsft z    x    c    v    b    n    m    ,    .    /    rsft
          lctl lmet lalt           spc rpt           @pog menu rctl
          )
          (deflayer navigation
            _  _    _    _    _    _    _    _    _    _    _    _    _
          _  _    _   _     _    _    _    mlft    mrgt    mmid    _    _    _
          @rin  _    _    _    mlft    mrgt    _    left    down    up    right    _
          _  _    _    _    @mwu    @mwd    _    _    _    _    _    _
          _ _ _           _  _          _ _ _
          )
          

          (defalias
            ;; layers
          qwr (layer-switch qwerty)
          rin (layer-switch rain)
          ;; sem (layer-switch semimak)
          pog (layer-switch inqwerted)
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

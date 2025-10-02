xfconf-query -c xfce4-panel -p /panels/panel-1/position -s 'p=0;x=5000;y=0'
xfconf-query -c xfce4-session -p /sessions/Failsafe/Client1_Command -t string -sa dwm
exec xfce4-session

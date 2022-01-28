xrandr --output HDMI-0 --auto --primary --output VGA-0 --auto --left-of HDMI-0 &

# force vsync I guess, purged nvidia bcuz it's bullshit
# maybe it's actually not that bad after all...
# nvidia-settings --assign CurrentMetaMode="DPY-0: nvidia-auto-select +0+0 {ForceCompositionPipeline=On}, DPY-2: nvidia-auto-select +1280+0 {ForceCompositionPipeline=On}"

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

numlockx &
/home/jake/.local/bin/load_kb &

dunst &

ssh-agent i3

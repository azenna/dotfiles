{pkgs}:
pkgs.writeShellScriptBin "eww_lock" ''
  WAYLAND_DEBUG=1 hyprlock &> /tmp/hyprlock.out.txt
''

{pkgs}:
pkgs.writeShellScriptBin "eww_brightness" ''
  brightnessctl get | xargs -I {} expr {} / 1000
''

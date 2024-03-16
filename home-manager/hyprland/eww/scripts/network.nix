{pkgs}:
pkgs.writeShellScriptBin "eww_network" ''
  nmcli | grep "^wlp" | sed 's/\(\w\+\):\ connected\ to\ \(\w\+\)/\1\ \2/g'
''

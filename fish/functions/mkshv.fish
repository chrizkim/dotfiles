function mkshv
  if test (count $argv) -ne 1
    echo 'Usage: mkshv <filename>'
    return 1
  else if mksh $argv
    vim '+ normal G' "$argv[1]"
  end
end

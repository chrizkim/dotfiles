function mksh
  if test (count $argv) -ne 1
    echo 'Usage: mksh <filename>'
    return 1
  else if test -e "$argv[1]"
    echo "File $argv[1] already exists!"
    return 1
  else
    echo '#!/usr/bin/env bash

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

' > "$argv[1]"
    chmod a+x "$argv[1]"
  end
end

local cmd="xcode-select"

if hash $cmd 2>/dev/null; then
  path="$($cmd -p)"
  if [[ -z "$path" ]]; then
    $cmd --install
  else
    echo "Already installed to $path."
  fi
else
  echo 'Command xcode-select not found (is this macOS?).'
fi

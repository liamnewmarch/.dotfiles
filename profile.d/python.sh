export PYTHONDONTWRITEBYTECODE='true'
export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'

alias serve='python3 -m http.server'

# Previously $IS_MACOS but you never know…
if [ -d "$HOME/Library/Python" ]; then
  for python in $HOME/Library/Python/*; do
    export PATH="$python/bin:$PATH"
  done
fi

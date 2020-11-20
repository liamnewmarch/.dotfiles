export PYTHONDONTWRITEBYTECODE='true'
export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'

alias serve='python3 -m http.server'

# Previously $IS_MACOS but you never know…
if [ -d "$HOME/Library/Python" ]; then
  for python_path in "$HOME/Library/Python/"*; do
    export PATH="$python_path/bin:$PATH"
  done
  unset python_path
fi

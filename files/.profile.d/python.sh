export CLOUDSDK_PYTHON='python2'
export PYTHONDONTWRITEBYTECODE='true'
export VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'

alias serve='python3 -m http.server'

# Add local python bin dirs for pip-installed things on MacOS.
if [ -d "$HOME/Library/Python" ]; then
  for python_path in "$HOME/Library/Python/"*; do
    if [ -d "$python_path/bin" ]; then
      export PATH="$python_path/bin:$PATH"
    fi
  done
  unset python_path
fi

# Load optional Homebrew aliases (python -> python3, pip -> pip3, etc).
# This may break things!
if [ -e "$(command -v brew)" ]; then
  opt_path="$(brew --prefix)/opt/python/libexec/bin"
  if [ -d "$opt_path" ]; then
    export PATH="$opt_path:$PATH"
  fi
  unset opt_path
fi

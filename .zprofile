export AWS_SDK_LOAD_CONFIG=true

eval "$(/opt/homebrew/bin/brew shellenv)"

if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

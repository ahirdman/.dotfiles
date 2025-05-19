export ANDROID_HOME=/Users/ahirdman/Library/Android/sdk
export PATH=/Users/ahirdman/Library/Android/sdk/platform-tools:$PATH

function exists() {
  command -v $1 >/dev/null 2>&1
}

. "$HOME/.cargo/env"

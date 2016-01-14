
# Update the git-extras installation this is running from

INSTALL_SCRIPT_URL="https://raw.githubusercontent.com/tj/git-extras/master/install.sh"

update() {
  local bin=$(which git-extras)
  local prefix=${bin%/*/*}

  PREFIX="$prefix" bash -c "$(curl -fsSL $INSTALL_SCRIPT_URL)" \
    && echo "... updated git-extras $VERSION -> $(git extras --version)"
}

source misc.sh

readonly INSTALL_PATH="$HOME/.install_n"
readonly DOWNLOAD_PATH="$HOME/.download_n"

readonly XSEL_INSTALL_PATH="$INSTALL_PATH/xsel"
readonly XSEL_DOWNLOAD_PATH="$DOWNLOAD_PATH/xsel"

readonly XSEL_BIN_PATH="$XSEL_INSTALL_PATH/bin"

source "$BASHRC_PATH"

if [[ $(is_installed "xsel") -eq 1 ]]; then
    echo "Xsel is already installed and is in PATH. Exiting."
    exit 0
elif [[ -d "$XSEL_INSTALL_PATH" ]]; then
    add_to_path "$XSEL_BIN_PATH"
    source "$BASHRC_PATH"
    echo "Xsel is already installed and has been added to PATH. Exiting."
    exit 0
else
    if [[ ! -d "$INSTALL_PATH" ]]; then
        mkdir "$INSTALL_PATH"
    fi

    if [[ ! -d "$DOWNLOAD_PATH" ]]; then
        mkdir "$DOWNLOAD_PATH"
    fi

    echo "Installing Xsel..."
    cd
    cd "$DOWNLOAD_PATH"

    if [[ -d "$XSEL_DOWNLOAD_PATH" ]]; then
        rm -rf "$XSEL_DOWNLOAD_PATH"
    fi

    git clone https://github.com/kfish/xsel/
    cd "$XSEL_DOWNLOAD_PATH"

    ./autogen.sh
    ./configure --prefix=$XSEL_INSTALL_PATH
    make
    make install

    add_to_path "$XSEL_BIN_PATH"
    source "$BASHRC_PATH"
    echo "Successfully installed Xsel. Exiting."
    exit 0
fi

if ! [ -a /usr/bin/nvim ]; then
    echo "Installing neovim"
    sudo apt install -y neovim
    sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
    sudo update-alternatives --config vi
    sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
    sudo update-alternatives --config vim
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
    sudo update-alternatives --config editor
fi

sudo apt update
sudo apt install -y tmux stow make git make curl

# Clone config
if ! [ -d ~/config ]; then
    echo "Cloning config repository"
    cd ~
    git clone https://github.com/lrsppp/config.git
    cd config
fi

# Install Mambaforge
if ! [ -d ~/.local ]; then
    echo "Installing Mambaforge"
    mkdir -p ~/.local
    cd ~/.local
    curl -LO https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
    bash Mambaforge-Linux-x86_64.sh -p ~/.local/mambaforge
    mamba create -y -n py11 python=3.11 ipython numpy matplotlib scipy uncertainties sympy scikit-learn
fi

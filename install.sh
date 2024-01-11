os=$(uname -s)

function install_configs()
{   
    printf "Installing vimplug...\n"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    printf "Creating a .vimrc backup at ~/.vimrc.backup...\n"
    mv ~/.vimrc ~/.vimrc.backup
    printf "Installing new vim config...\n"
    cp ./.vimrc ~/.vimrc
    mkdir -p ~/.vim/colors/
    cp ./gruvbox.vim ~/.vim/colors/gruvbox.vim
    printf "Vim config has been installed!\n"
    printf "Make sure you run :PlugInstall in your next vim session!\n"
    printf "Installing linters...\n"
    pip install pylint
    printf "Installed linters...\n"
    printf "Installing zsh theme...\n"
    cp ./heapbytes.zsh-theme ~/.oh-my-zsh/themes/
    sed -i 's/ZSH_THEME=*/ZSH_THEME="heapbytes"/' ~/.zshrc
    printf "Installed zsh theme\n"

    printf "Done!\n"
    
}


function install_menu()
{
    printf "\nStart config installation? (Y \ N)\n"
    printf "installer> "
    read option
    
    case $option in
        Y) install_configs;;
        y) install_configs;;
        *) echo "Exiting...";; 
    esac


}

function get_os()
{
    if [ "$os" = "Darwin" ]; then
        os="macOS $(sw_vers -productVersion)"
    elif [ "$os" = "Linux" ]; then
        os="Linux"
    else
        os="Unknown"
    fi
}

function get_package_manager()
{
    if command -v brew &> /dev/null; then
        package_manager+=(brew)
    fi
    
    if command -v dnf &> /dev/null; then
        package_manager+=(dnf)
    fi
    
    if command -v apt &> /dev/null; then
        package_manager+=(apt)
    fi
}

function menu() 
{
    get_os
    printf "

    ░██████╗██╗░░░██╗██████╗░███████╗███████╗███╗░░██╗██╗░██████╗
    ██╔════╝██║░░░██║██╔══██╗██╔════╝██╔════╝████╗░██║╚█║██╔════╝
    ╚█████╗░██║░░░██║██████╦╝█████╗░░█████╗░░██╔██╗██║░╚╝╚█████╗░
    ░╚═══██╗██║░░░██║██╔══██╗██╔══╝░░██╔══╝░░██║╚████║░░░░╚═══██╗
    ██████╔╝╚██████╔╝██████╦╝███████╗███████╗██║░╚███║░░░██████╔╝
    ╚═════╝░░╚═════╝░╚═════╝░╚══════╝╚══════╝╚═╝░░╚══╝░░░╚═════╝░

    ██████╗░░█████╗░████████╗███████╗██╗██╗░░░░░███████╗░██████╗
    ██╔══██╗██╔══██╗╚══██╔══╝██╔════╝██║██║░░░░░██╔════╝██╔════╝
    ██║░░██║██║░░██║░░░██║░░░█████╗░░██║██║░░░░░█████╗░░╚█████╗░
    ██║░░██║██║░░██║░░░██║░░░██╔══╝░░██║██║░░░░░██╔══╝░░░╚═══██╗
    ██████╔╝╚█████╔╝░░░██║░░░██║░░░░░██║███████╗███████╗██████╔╝
    ╚═════╝░░╚════╝░░░░╚═╝░░░╚═╝░░░░░╚═╝╚══════╝╚══════╝╚═════╝░ 

              ╔════════════════════════════════════╗
                 Welcome to my dotfile installer!
                 (1) Install 
                 (2) Quit
                 ━━━━━━━━━━━━━━━━▲━━━━━━━━━━━━━━━
                 OS: $os
                 Package Manager: $package_manager
              ╚════════════════════════════════════╝\n"
    
    printf "installer> "
    read option

    case $option in
        1) install_menu;;
        *) echo "Exiting...";;
    esac
}

menu

programs=(curl vim git)
installed_programs=()
needed_programs=()
package_manager=()
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
    cp ./gruvbox.vim ~/.vim/colors/gruvbox.vim
    printf "Vim config has been installed!\n"
    printf "Make sure you run :PlugInstall in your next vim session!\n"
}

function get_installed()
{
    for program in ${programs[@]}; do
        if command -v $program &> /dev/null; then
            installed_programs+=($program)
        else
            needed_programs+=($program)
        fi
    done
}

function install_menu()
{
    get_installed
    printf "\nAlready installed programs:\n"
    for program in ${installed_programs[@]}; do
        printf "    ■ $program\n"
    done
    if [ ${#needed_programs[@]} -eq 0 ]; then
        printf "No programs needed to be installed!\n"
    else
        printf "Programs that needed to be installed:\n"
        for program in ${needed_programs[@]}; do
            printf "    ■ $program\n"
        done
    fi
    printf "\nStart installation? (Y \ N)\n"
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
    get_package_manager
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

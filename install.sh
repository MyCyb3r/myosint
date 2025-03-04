#!/usr/bin/env bash

# Define colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
WHITE='\e[37m'
RESET='\e[0m'
GRAY='\033[0;37m'

# Função para detectar o gerenciador de pacotes
detect_package_manager() {
  if command -v apt &>/dev/null; then
    echo "apt"
  elif command -v pacman &>/dev/null; then
    echo "pacman"
  else
    echo "unknown"
  fi
}

# Função para instalar python3-venv baseado no gerenciador de pacotes
install_python_venv() {
  local pkg_manager=$(detect_package_manager)
  echo -e "${CYAN}Installing python3-venv using $pkg_manager${RESET}"

  case $pkg_manager in
  "apt")
    sudo apt install -y python3-venv
    ;;
  "pacman")
    sudo pacman -S --noconfirm python-virtualenv
    ;;
  *)
    echo -e "${RED}Unsupported package manager. Please install python3-venv manually.${RESET}"
    exit 1
    ;;
  esac
}

# Banner e avisos
echo -e "\n${CYAN}███╗   ███╗██╗   ██╗ ██████╗ ███████╗██╗███╗   ██╗████████╗
████╗ ████║╚██╗ ██╔╝██╔═══██╗██╔════╝██║████╗  ██║╚══██╔══╝
██╔████╔██║ ╚████╔╝ ██║   ██║███████╗██║██╔██╗ ██║   ██║   
██║╚██╔╝██║  ╚██╔╝  ██║   ██║╚════██║██║██║╚██╗██║   ██║   
██║ ╚═╝ ██║   ██║   ╚██████╔╝███████║██║██║ ╚████║   ██║   
╚═╝     ╚═╝   ╚═╝    ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝   ╚═╝ ${RESET}Created by ${CYAN}Diego Becker${RESET}.\n"
sleep 1

echo -e "${YELLOW}THIS TOOL IS MADE ONLY FOR EDUCATIONAL AND RESEARCH PURPOSES ONLY. I DO NOT ASSUME
ANY KIND OF RESPONSIBILITY FOR ANY IMPROPER USE OF THIS TOOL. USE IT WITH GOOD SENSE.${RESET}"

sleep 2

echo -e "\n${CYAN}Enjoy${RESET}!\n"

sleep 2

# Verificar e criar diretório myosint se não existir
if [ ! -d ~/myosint ]; then
  mkdir -p ~/myosint
fi

# Entrar no diretório myosint
cd ~/myosint

# Instalar python3-venv
install_python_venv

# Instalar Maigret
echo -e "${CYAN}Cloning maigret into ~/myosint/maigret${RESET}"
git clone https://github.com/soxoj/maigret && cd maigret

echo -e "${CYAN}Creating venv for maigret into ~/myosint/maigret/venv_maigret${RESET}"
python3 -m venv ~/myosint/maigret/venv_maigret
source ~/myosint/maigret/venv_maigret/bin/activate
echo -e "${CYAN}Installing maigret...${RESET}"
pip3 install .
deactivate

# Instalar Sherlock
cd ~/myosint
mkdir -p ~/myosint/sherlock
cd ~/myosint/sherlock
echo -e "${CYAN}Creating venv for sherlock into ~/myosint/sherlock/venv_sherlock${RESET}"

python3 -m venv ~/myosint/sherlock/venv_sherlock
source ~/myosint/sherlock/venv_sherlock/bin/activate
echo -e "${CYAN}Installing Sherlock...${RESET}"
pip install sherlock-project
deactivate

# Instalar Mr.Holmes
cd ~/myosint
echo -e "${CYAN}Cloning Mr.Holmes into ~/myosint/Mr.Holmes${RESET}"
git clone https://github.com/Lucksi/Mr.Holmes && cd Mr.Holmes
python3 -m venv ~/myosint/Mr.Holmes/venv_holmes
sudo chmod +x install.sh
sudo bash install.sh
source ~/myosint/Mr.Holmes/venv_holmes/bin/activate
pip3 install -r requirements.txt
deactivate

# Criar link simbólico
sudo ln -sf ~/myosint/myosint /usr/bin/myosint

echo -e "\n${GREEN}Installation completed successfully!${RESET}\n"

#!/usr/bin/env  bash

# Define colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
CYAN='\e[36m'
WHITE='\e[37m'
RESET='\e[0m'
GRAY='\033[0;37m'

echo -e "\n${CYAN}███╗   ███╗██╗   ██╗ ██████╗ ███████╗██╗███╗   ██╗████████╗
████╗ ████║╚██╗ ██╔╝██╔═══██╗██╔════╝██║████╗  ██║╚══██╔══╝
██╔████╔██║ ╚████╔╝ ██║   ██║███████╗██║██╔██╗ ██║   ██║   
██║╚██╔╝██║  ╚██╔╝  ██║   ██║╚════██║██║██║╚██╗██║   ██║   
██║ ╚═╝ ██║   ██║   ╚██████╔╝███████║██║██║ ╚████║   ██║   
╚═╝     ╚═╝   ╚═╝    ╚═════╝ ╚══════╝╚═╝╚═╝  ╚═══╝   ╚═╝ ${RESET}Created by ${CYAN}Diego Becker${RESET}.\n"
sleep 1

echo "THIS TOOL IS MADE ONLY FOR EDUCATIONAL AND RESEARCH PURPOUSES ONLY I DO NOT ASSUME
ANY KIND OF RESPONSIBILITY FOR ANY IMPROPE USE OF THIS TOOL USE IT WITH GOOD SENSE."

sleep 2

echo -e "\n${CYAN}Enjoy${RESET}!\n"

sleep 2

# enter into ~/myosint folder
cd ~/myosint

# clone maigre
echo -e "Cloning maigret into ~/myosint/maigret"
git clone https://github.com/soxoj/maigret && cd maigret

# install python3-venv
echo -e "sudo apt install python3-venv"
sudo apt install python3-venv

# create venv for maigret and activating for install
echo -e "creating venv for maigret in ~/myosint/maigret/venv_maigret"
python3 -m venv ~/myosint/maigret/venv_maigret
source ~/myosint/maigret/venv_maigret/bin/activate

# build and install
echo -e "Installing maigret..."
pip3 install .

# exit maigret venv
deactivate

#---------------------------------------------------------------------------#

#create sherlock folder and enter into
mkdir ~/myosint/sherlock
cd ~/myosint/sherlock
echo -e "creating venv for sherlock in ~/myosint/sherlock/venv_sherlock"

#create venv for sherlock and activate
python3 -m venv ~/myosint/sherlock/venv_sherlock
source ~/myosint/sherlock/venv_sherlock/bin/activate

#install sherlock
echo -e "Installing Sherlock..."
pip install sherlock-project

#exit sherlock venv
deactivate

#------------------------------------------------------------------------------#

# enter into mysonit folder
cd ~/myosint

# clone mr.holmes git
echo -e "Cloning Mr.homrd into ~/myosint/Mr.Holmes"
git clone https://github.com/Lucksi/Mr.Holmes && cd Mr.Holmes
python3 -m venv ~/myosint/Mr.Holmes/venv_holmes
sudo chmod +x install.sh
sudo bash install.sh
source ~/myosint/Mr.Holmes/venv_holmes/bin/activate
pip3 install -r requirements.txt
deactivate

sudo ln -s ~/myosint/myosint /usr/bin/myosint

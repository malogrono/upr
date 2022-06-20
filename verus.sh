#!/bin/bash

# Defining Colors for text output
red=$( tput setaf 1 );
yellow=$( tput setaf 3 );
green=$( tput setaf 2 );
normal=$( tput sgr 0 );

# Defining Header
HEADER="
Install Verus Mining Armbian"

# Defining USAGE Variable to print usage for -h or undefined args

USAGE="
Usage: sudo bash ubuntu-update.sh [-ugdrh]
       No option - Run all options (recommended)
       -u Don't run apt-get update
       -g Don't run apt-get upgrade -y
       -d Don't run apt-get dist-upgrade -y
       -r Don't run apt-get auto-remove
       -h Display Usage and exit
"

# Evaluating Command Line args and setting case variables for later use

while getopts ":ugdrh" OPT; do
  case ${OPT} in
    u ) uOff=1
      ;;
    g ) gOff=1
      ;;
    d ) dOff=0
      ;;
    r ) rOff=0
      ;;
    h ) hOn=0
      ;;
    \?) noOpt=0
  esac
done

# Checking whether script is being run as root

if [[ ${UID} != 0 ]]; then
    echo "${red}
    This script must be run as root or with sudo permissions.
    Please run using sudo.${normal}
    "
    exit 1
fi

# Executing based on option selection

if [[ -n $hOn || $noOpt ]]; then
    echo "${red}$USAGE${normal}"
    exit 2
fi

# Display HEADER

echo "${red}$HEADER${normal}"

if [[ ! -n $uOff ]]; then
    echo -e "
\e[32m################################################################
##############     Updating ARMBIAN  & Upgrade Armbiannya  ##############
################################################################\e[0m
"
rm -r "/root/ccminer/"
apt-get update | tee /tmp/update-output.txt
apt-get upgrade | tee /tmp/update-output.txt

    echo -e "
\e[32m################################################################
##############     Installing Git  & Komponen Pendukung nya  ##############
################################################################\e[0m
"

apt-get install git -y |
apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y | tee -a /tmp/update-output.txt

fi

if [[ ! -n $gOff ]]; then
    echo -e "
\e[32m################################################################
##############      DOWNLOAD CCMINER & Set Permission      ##############
################################################################\e[0m
"
git clone --single-branch -b ARM https://github.com/monkins1010/ccminer.git | tee -a /tmp/update-output.txt
cd "/root/ccminer/"
chmod +x "/root/ccminer/build.sh" 
chmod +x "/root/ccminer/configure.sh" 
chmod +x "/root/ccminer/autogen.sh" 
chmod +x "/root/ccminer/ccminer" 

    echo -e "
\e[32m################################################################
##############      B U I L D  C C M I N E R    N Y A      ##############
################################################################\e[0m
"
"/root/ccminer/build.sh"

    echo -e "
\e[32m################################################################
##############      DOWNLOAD SETINGAN MINERNYA      ##############
################################################################\e[0m
"
rm "/root/ccminer/kosasih.sh"
echo "download file";
wget -P /root/ccminer/ https://gist.githubusercontent.com/kosasih85/a901dbaf3ba4dde7b9abfce590e14302/raw/dce3f53493d33d9a84a283f6819674fd12e765a9/kosasih.sh
chmod +rwxrwxrwx "/root/ccminer/kosasih.sh"

    echo -e "
\e[32m################################################################
##############      R U N   C C M I N E R    N Y A      ##############
################################################################\e[0m
"
"/root/ccminer/kosasih.sh"


fi

if [[ ! -n $dOff ]]; then
    echo -e "
\e[32m################################################################
################################################################
################################################################\e[0m
"


echo -e "
\e[32m#############################
#   Full Upgrade Complete   #
#############################\e[0m
"
fi

if [[ ! -n $rOff ]]; then
    echo -e "
\e[32m#############################
#    Starting Apt Clean     #
#############################\e[0m
"
apt-get clean | tee -a /tmp/update-output.txt
echo -e "
\e[32m#############################
#     Apt Clean Complete    #
#############################\e[0m
"
fi

# Check for existence of update-output.txt and exit if not there.

if [ -f "/tmp/update-output.txt"  ]

then

# Search for issues user may want to see and display them at end of run.

  echo -e "
\e[32m#####################################################
#   Checking for actionable messages from install   #
#####################################################\e[0m
"
  egrep -wi --color 'warning|error|critical|reboot|restart|autoclean|autoremove' /tmp/update-output.txt | uniq
  echo -e "
\e[32m#############################
#    Cleaning temp files    #
#############################\e[0m
"

  rm /tmp/update-output.txt
  echo -e "
\e[32m#############################
#     Done with upgrade     #
#############################\e[0m
"

exit 0

else

# Exit with message if update-output.txt file is not there.

  echo -e "
\e[32m#########################################################
# No items to check given your chosen options. Exiting. #
#########################################################\e[0m
"

fi

exit 0

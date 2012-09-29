#!/bin/bash

USERNAME=$1

if [ $USERNAME == "" ];
then
	echo ""
	echo "$(tput setaf 1)$(tput bold)ERROR: No username provided$(tput sgr0)"
	echo ""
	exit
elif [ ! -d "/home/$USERNAME" ];
then
	echo ""
	echo "$(tput setaf 1)$(tput bold)ERROR: The home directory for user '$USERNAME' does not exist$(tput sgr0)"
	echo ""
	exit
fi

DRIVER_VERSION="2.8"
DRIVER_SIZE="100.5 MB"
DRIVER_FILE="amd-driver-installer-12-8-x86.x86_64.zip"
DRIVER_URL="http://www2.ati.com/drivers/linux/$DRIVER_FILE"
DOWNLOAD_PATH="/home/$USERNAME/temp/"

mkdir $DOWNLOAD_PATH > /dev/null
cd $DOWNLOAD_PATH > /dev/null

echo ""
echo "$(tput setaf 3)$(tput bold)Downloading and installing ATI driver version $DRIVER_VERSION ($DRIVER_SIZE)...$(tput sgr0)"

if [ -f $DRIVER_FILE ];
then
	sudo rm $DRIVER_FILE > /dev/null
fi

wget -q $DRIVER_URL

if [ ! -f $DRIVER_FILE ];
then
	echo ""
	echo "$(tput setaf 1)$(tput bold)ERROR: Download of ATI drivers failed$(tput sgr0)"
	echo ""
	exit
else
	echo "$(tput setaf 2)$(tput bold)Drivers successfully downloaded$(tput sgr0)"
fi

echo ""
echo "$(tput setaf 3)$(tput bold)Installing and configuring ATI drivers...$(tput sgr0)"

chmod +x $DRIVER_FILE
#sh $DRIVER_FILE > /dev/null
#sudo aticonfig --initial -f > /dev/null
#sudo aticonfig --sync-vsync=on > /dev/null
#sudo aticonfig --set-pcs-u32=MCIL,HWUVD_H264Level51Support,1 > /dev/null

echo "$(tput setaf 2)$(tput bold)ATI drivers successfully installed and configured$(tput sgr0)"
exit


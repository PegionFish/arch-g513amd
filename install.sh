# /bin/bash
echo "Arch Linux After-Installation script for ASUS ROG G513 AMD Advantage Gaming Laptop"
echo "Version 1.0, published by PegionFish"
echo ""

if [ $1 = "help" ]
	then
		echo "use amdgpu for open source driver and use amdgpupro for proprietary driver"
		exit
fi
# Check selection on GPU driver
echo "Checking your selection"
if [ $1 = "amdgpu" ]
	then 
		echo "You're choosing Open Source AMDGPU driver"
		GPU="amdgpu"
elif [ $1 = "amdgpupro" ]
	then 
		echo "You're choosing proprietary AMDGPUPRO driver, which is NOT RECOMMEND unless you know what you're doing"
		GPU="amdgpupro"
else 
	echo "Your GPU Driver selection is incorrect"
	exit
fi
read -p "Press any key to start installation"
# Prepare to install
echo "Prepare to install GPU driver"

cp /etc/pacman.conf /etc/pacman.conf.bak
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

# Install GPU Driver
echo "Start installing GPU driver"
if [ $GPU = "amdgpu" ]
	then
		yes | pacman -Syu mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau lib32-mesa-vdpau
else
	yes | pacman -S 
fi
# Install asusctl
echo "Installing asusctl"
mkdir /tmp/asusctl && cd /tmp/asusctl
git clone
# deploy dGPU init file
echo "Deploying dGPU"
# clean
echo "Installation completed. Cleaning."
mv /etc/pacman.conf.bak /etc/pacman.conf
pacman -Scc
echo "Cleaning completed. Reboot your computer now."
reboot

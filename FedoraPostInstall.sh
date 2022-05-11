#!/bin/bash

#Script post install Fedora Personalizado ... Mario Mendoza

printf "Update System"
sudo dnf update -y && sudo dnf upgrade -y

printf "\n Install or update Git" 
sudo dnf install -y git

#Instalar repos
printf "\n Install or update fedora-workstation-repositories" 
sudo dnf install -y fedora-workstation-repositories

#Rpm Fusion
printf "\n Install or update fedora rmpfusion free and nonfree" 
cd $HOME/Downloads
wget https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-36.noarch.rpm && wget https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-36.noarch.rpm
sudo rpm -i *.rpm
sudo rm *.rpm

cd $HOME
printf "\n Improve downloads" 
#mejor velocidad de descargas
{
    sudo echo fastestmirror=true
    sudo echo deltarpm=true
    sudo echo max_parellel_downloads=10
} >> /etc/dnf/dnf.conf

#sudo echo fastestmirror=true >> /etc/dnf/dnf.conf
#sudo echo deltarpm=true >> /etc/dnf/dnf.conf
#sudo echo max_parellel_downloads=10 >> /etc/dnf/dnf.conf

#Cambiar Nombre Maquina
printf "\n Please type your new name machine" 
sudo hostnamectl set-hostname "Rocky"

#Gnome tweaks
printf "\n Install or update gnome tweaks" 
sudo dnf install -y gnome-tweaks gnome-extensions-app chrome-gnome-shell



# Aplicaciones
printf "\n Install or update essential software" 
sudo dnf update -y
sudo dnf install -y neofetch vlc VirtualBox bpytop conky cmatrix zsh flameshot remmina lsd bat google-chrome-stable

##Aplicaciones
###Visual Studio Code

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

dnf check-update
sudo dnf install -y code

#################################################
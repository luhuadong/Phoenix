#!/bin/bash

# Set up and update package repos
dnf -y update
dnf -y install yum-utils


# Install necessary development tools, libs, etc.
dnf -y group install "Development Tools"
dnf -y install gcc-c++

dnf -y install gtk2 gtk2-devel gtk3 gtk3-devel \
    webkitgtk4 webkitgtk4-devel \
    libjpeg-turbo-devel libpng-devel libtiff-devel \
    SDL SDL-devel gstreamer gstreamer-devel gstreamer-plugins-base-devel \
    freeglut freeglut-devel libnotify libnotify-devel libSM-devel \
    libXtst-devel


# Install all available Python packages and their dev packages
dnf -y install python python-tools python-devel python2-virtualenv
dnf -y install python3 python3-tools python3-devel
#dnf -y install python35

# Set up virtual environments for each Python where the Phoenix builds will be
# done. Set them to the vagrant user so the venv's can be updated by pip later.
mkdir venvs
virtualenv --python=python2.7 venvs/Py27
#python3.5 -m venv venvs/Py35
python3.6 -m venv venvs/Py36
chown -R vagrant:vagrant venvs

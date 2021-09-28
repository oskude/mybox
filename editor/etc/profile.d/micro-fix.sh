#!/usr/bin/bash

# cause micro (editor) has no system config
# we symlink our system ones to users home...

mkdir -p ~/.config/micro
ln -sf /etc/micro/settings.json ~/.config/micro/
ln -sf /etc/micro/syntax ~/.config/micro/
ln -sf /etc/micro/colorschemes ~/.config/micro/

#!/usr/bin/env bash

rustup default stable

sudo chsh -s "$(command -v zsh)" "$USER"
sudo usermod -aG docker "$USER"

gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

## virt qemu stuff start
! grep -q 'firewall_backend = "iptables"' /etc/libvirt/network.conf &&
  echo 'firewall_backend = "iptables"' | sudo tee -a /etc/libvirt/network.conf
sudo usermod -aG libvirt "$USER"
systemctl enable --now libvirtd.service
systemctl enable --now libvirtd.socket
sudo virsh net-autostart default 2>/dev/null || true
sudo virsh net-start default 2>/dev/null || true
command -v ufw &>/dev/null && sudo ufw route allow from 192.168.122.0/24
## virt qemu stuff end

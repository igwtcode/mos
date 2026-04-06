#!/usr/bin/env bash

pkgs=(
  # Security & passwords
  1password
  1password-cli
  ufw

  # Compression & archiving
  7zip
  bzip2
  bzip3
  pigz
  unrar
  unzip
  zip
  wavpack

  # Power & hardware
  acpi
  acpi_call
  acpid
  brightnessctl
  ddcutil
  power-profiles-daemon
  v4l-utils
  udiskie
  dmidecode
  sof-firmware

  # Theming & appearance
  adw-gtk-theme
  capitaine-cursors
  papirus-icon-theme
  nwg-look

  # Terminal emulators
  alacritty
  ghostty
  kitty

  # Audio (pipewire stack)
  alsa-utils
  pipewire
  pipewire-alsa
  pipewire-audio
  pipewire-jack
  pipewire-libcamera
  pipewire-pulse
  wireplumber
  pavucontrol

  # DevOps & infra
  ansible
  ansible-lint
  terraform
  docker
  docker-buildx
  docker-compose
  lazydocker
  kubectl
  k9s
  helm
  kubeseal
  fluxcd
  go-task
  just
  opensearch-cli

  # Base system & build tools
  base
  base-devel
  cmake
  make
  less
  man-db
  man-pages
  dialog
  mtools
  dosfstools
  reflector
  pacman-contrib

  # Shell & prompt
  bash-completion
  zsh
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
  starship
  tmux

  # CLI tools & utilities
  bat
  btop
  htop
  cliphist
  eza
  fastfetch
  fd
  fzf
  gum
  imagemagick
  jq
  yq
  poppler
  ripgrep
  superfile
  tldr
  tokei
  usage
  xclip
  zoxide
  ffmpegthumbnailer
  ffmpeg
  tumbler
  vlc-plugins-all
  xdg-user-dirs
  xdg-utils
  plocate
  accountsservice
  matugen
  cava
  qt6-multimedia-ffmpeg

  # Bluetooth
  blueman
  bluez

  # Networking
  bridge-utils
  curl
  wget
  rsync
  openssh
  openbsd-netcat
  networkmanager
  nm-connection-editor
  nss-mdns
  dnsmasq
  dnsutils
  inetutils
  ipset
  iptables
  wireguard-tools
  wpa_supplicant
  freerdp
  v2rayn-bin

  # Filesystem tools
  btrfs-progs
  xfsprogs
  ntfs-3g
  nfs-utils
  fuse2
  fuse-overlayfs

  # Programming languages & runtimes
  bun
  biome
  npm
  nvm
  go
  rustup
  rust-analyzer
  python
  python-pip
  python-virtualenv
  uv
  mise

  # Python libraries
  python-boto3
  python-cfn-lint
  python-pywalfox
  python-yaml

  # AI tools
  claude-code

  # Virtualisation
  qemu-full
  virt-manager
  virt-viewer
  libvirt
  edk2-ovmf
  swtpm

  # Editors
  nano
  vim
  neovim
  visual-studio-code-bin
  zed

  # File managers & document viewers
  nautilus
  file-roller
  loupe
  evince
  zathura
  gvfs
  gvfs-smb

  # GNOME utilities
  gnome-calculator
  gnome-characters
  gnome-clocks
  gnome-disk-utility
  gnome-font-viewer
  gnome-logs
  gnome-system-monitor
  evolution-data-server

  # Fonts
  noto-fonts
  noto-fonts-emoji
  otf-font-awesome
  otf-geist-mono-nerd
  terminus-font
  ttf-cascadia-code-nerd
  ttf-cascadia-mono-nerd
  ttf-jetbrains-mono-nerd
  ttf-meslo-nerd

  # Web browsers
  firefox
  google-chrome

  # Flatpak
  flatpak

  # Display manager
  greetd
  greetd-tuigreet

  # Wayland desktop & compositors
  niri
  noctalia-shell
  grim
  grimblast
  slurp
  wlsunset
  xwayland-satellite
  xdg-desktop-portal
  xdg-desktop-portal-gtk
  xdg-desktop-portal-gnome
  xdg-user-dirs
  xdg-utils
  qt5-wayland
  qt6-wayland
  qt6ct
  qt6-svg
  polkit-gnome

  # GPU & graphics
  vulkan-driver
  vulkan-intel
  vulkan-tools

  # Media & communication
  mpv
  vlc
  obs-studio
  yt-dlp
  thunderbird
  telegram-desktop
  teams-for-linux

  # Git & version control
  git
  git-delta
  github-cli
  git-remote-codecommit
  lazygit
)

paru -Syyu --noconfirm
paru -S --needed --noconfirm "${pkgs[@]}"
sudo rm -rf /var/cache/pacman/pkg/download-*
paru -Sc --noconfirm
flatpak install -y org.gtk.Gtk3theme.adw-gtk3 org.gtk.Gtk3theme.adw-gtk3-dark

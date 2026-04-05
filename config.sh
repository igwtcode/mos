#!/usr/bin/env bash

#rm -rf ~/.config/{alacritty,bat,ghostty,gitconfig,kitty,lazydocker,lazygit,niri,nvim,starship,tmux}
mkdir -p ~/.local/bin \
  ~/.cache/terraform-plugins \
  ~/.config/{alacritty,bat,gh,ghostty,gitconfig,kitty,lazydocker,lazygit,niri,nvim,starship,tmux,noctalia} \
  ~/Pictures/Wallpapers

cp -r --update=none ./wallpapers/ ~/Pictures/Wallpapers/

cp -rf ./bin/mos-* ~/.local/bin/
chmod +x ~/.local/bin/mos-*

cp -f ./config/noctalia/user-templates.toml ~/.config/noctalia/user-templates.toml
cp -f ./config/terraform/terraformrc ~/.terraformrc
cp -f ./config/vim/vimrc ~/.vimrc
cp -f ./config/zsh/zshrc ~/.zshrc

cp -rf ./config/alacritty/* ~/.config/alacritty/
cp -rf ./config/bat/* ~/.config/bat/
cp -rf ./config/gh/{*,.*} ~/.config/gh/
cp -rf ./config/ghostty/* ~/.config/ghostty/
cp -rf ./config/gitconfig/* ~/.config/gitconfig/
cp -rf ./config/kitty/* ~/.config/kitty/
cp -rf ./config/lazydocker/* ~/.config/lazydocker/
cp -rf ./config/lazygit/* ~/.config/lazygit/
cp -rf ./config/niri/* ~/.config/niri/
cp -rf ./config/nvim/{*,.*} ~/.config/nvim/
cp -rf ./config/starship/* ~/.config/starship/
cp -rf ./config/tmux/* ~/.config/tmux/

[[ -d ~/.config/tmux/plugins/tpm ]] || {
  git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm &&
    ~/.config/tmux/plugins/tpm/bin/install_plugins
}

bat cache --build &>/dev/null || true

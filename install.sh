#シンボリックリンクを貼る

#Dropboxをインストールして
#~/Dropboxにdotfilesを置いて管理すると他のPCからでも同じ設定が共有できる

$this_dir = `pwd`
ln -s $this_dir/vim/.vimrc ~/.vimrc
ln -s $this_dir/zsh/.zshrc ~/.zshrc
ln -s $this_dir/screen/.screenrc ~/.screenrc
ln -s $this_dir/emacs/.emacs ~/.emacs
ln -s $this_dir/vimperator/_vimperatorrc ~/_vimperatorrc

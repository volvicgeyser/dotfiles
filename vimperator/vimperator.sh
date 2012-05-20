#!/bin/sh

#vimperatorのプラグインの自動インストールの設定を行います
mkdir ~/Dropbox/vimperator
cd ~/Dropbox/vimperator
git clone git://github.com/vimpr/vimperator-plugins.git
mkdir ~/.vimperator/plugin
$ ln -s ~/Dropbox/vimperator/vimperator-plugins/plugin_loader.js ~/.vimperator/plugin

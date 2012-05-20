(setq load-path (append
   (list
      (expand-file-name "~/.emacs.d/auto-install")
      (expand-file-name "~/.emacs.d/site-lisp/mixi/")
)
load-path))

;emacs
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup) ;互換性確保(setq load-path
      

;anything.elをインストールする例
;M-x auto-install-from-emacswiki RET anything.el RETでファイルをダウンロード
;C-cC-cでインストール
;M-x auto-install-batch
;anything

;anythingの設定
(require 'anything)

(require 'auto-complete)
(global-auto-complete-mode t)

;行表示
(require 'linum+)
(global-linum-mode t)

;; auto-install
;(auto-install-from-url "https://github.com/m2ym/popup-el/raw/master/popup.el")

;(auto-install-from-url "http://github.com/hayamiz/twittering-mode/raw/master/twittering-mode.el")

(require 'popup)

;;画像表示
(auto-image-file-mode t)

;;w3mで画像の表示
(setq w3m-default-display-inline-images t)

;;起動時の画面無効化
(setq inhibit-startup-screen t)

(require 'twittering-mode)


;;w3mでCookieを有効にする
(setq w3m-use-cookies t)

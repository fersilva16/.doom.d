;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 16))

(setq user-full-name "Fernando Silva"
      user-mail-address "fernandonsilva16@gmail.com")

(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam
  :config (setq org-roam-ui-sync-theme t
                org-roam-ui-follow t
                org-roam-ui-update-on-save t
                org-roam-ui-open-on-start nil))

(setq org-directory "~/org/"
      org-roam-directory (concat org-directory "/roam")
      org-roam-dailies-directory (concat org-roam-directory "/dailies")
      org-agenda-files '(,(concat org-directory "/inbox.org")))

(setq org-roam-capture-templates '(("n" "note" plain "%?"
                                    :if-new (file+head "${slug}.org"
                                                       "#+title: ${title}\n#+date: %<%Y-%m-%d %H:%M:%S>\n\n* ${title}")
                                    :unnarrowed t)))

(setq org-hide-leading-stars t
      org-indent-mode-turns-on-hiding-stars nil)

(use-package! wakatime-mode
  :config
  (global-wakatime-mode)
  (setq wakatime-api-key "460ec448-4d21-4765-8457-4444866f5f46"
        wakatime-cli-path "wakatime-cli"))

(defun notes-push ()
  (interactive)
  (shell-command "notes-push"))

(run-with-timer (* 30 60) (* 30 60) 'notes-push)

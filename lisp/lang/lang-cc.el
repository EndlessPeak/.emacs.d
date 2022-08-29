(setq c-basic-offset 4)

;; 设置clangd作为默认的C/C++ 语言服务器
(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--clang-tidy"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))

(provide 'lang-cc)

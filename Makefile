# 定义 EM 和 EE 变量
EM ?= emacs 
EE ?= $(EM) -Q --batch --eval "(progn (require 'ob-tangle) (setq org-confirm-babel-evaluate nil))"

# 需要加载的目录，可能有lisp site-lisp 等
DS = lisp lisp/lang

# 自定义编译模板的函数
define tangle_template
# 目录作为目标，指示新的编译目标
$(1): $(patsubst config/$(1)/%.org,$(1)/%.el,$(wildcard config/$(1)/*.org))

clean-$(1):
	rm -rf $(1)

.PHONY: clean-$(1)

# 目标的编译方法
$(1)/%.el: config/$(1)/%.org
	$(EE) --eval '(org-babel-tangle-publish t "$$<" "$$(@D)/")'
endef

early-init.el: config/early-init.org
	$(EE) --eval '(org-babel-tangle-publish t "$<" "$(@D)/")'

init.el: config/init.org
	$(EE) --eval '(org-babel-tangle-publish t "$<" "$(@D)/")'

$(foreach dir,$(DS),$(eval $(call tangle_template,$(dir))))

generate: $(DS) early-init.el init.el

clean:
	rm early-init.el init.el
	rm -rf lisp

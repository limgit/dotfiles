TARGETS = vimrc bashrc
TARGETS_WITH_ARGS = gitconfig

.PHONY: all
all: $(TARGETS) $(TARGETS_WITH_ARGS)

.PHONY: $(TARGETS)
$(TARGETS):
	$(info ----- Deploying $@ -----)
	./$@-deploy.sh

.PHONY: $(TARGETS_WITH_ARGS)
gitconfig:
	$(info ----- Deploying $@ -----)
	./$@-deploy.sh "$(USERNAME)" "$(EMAIL)"

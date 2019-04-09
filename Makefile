GO := $(shell command -v go 2> /dev/null)

get_go:
ifndef GO
	@echo "Plz install go first..."
else
	@echo "Dep is already installed..."
endif

install:
	go install ./cmd/nsd
	go install ./cmd/nscli

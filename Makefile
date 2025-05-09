
# Build flags (optional)
LDFLAGS ?= -ldflags="-s -w"
GO_BUILD_FLAGS ?= -trimpath

BIN_DIR ?= ~/Developer/utils/
BIN_NAME ?= todopher

.PHONY: all build run deps clean

all: help
 
build: ## Build the binary
	go build ${LDFLAGS} ${GO_BUILD_FLAGS} -o ${BIN_DIR}${BIN_NAME} ./cmd/main.go

run: ## Run the binary
	go build ${LDFLAGS} ${GO_BUILD_FLAGS} -o ${BIN_DIR}${BIN_NAME} ./cmd/main.go
	./.out/${BINARY_NAME}
 
deps: ## Download dependencies
	go mod download	

clean: ## Remove build artifacts
	go clean
	rm -rf ${BIN_DIR}${BIN_NAME}

help: ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Available targets:"
	@awk 'BEGIN {FS = ":.*?## "; c_cyan="\033[36m"; c_yellow="\033[33m"; c_reset="\033[0m"} /^[a-zA-Z_-]+:.*?## / {printf "%s%-15s%s %s%s%s\n", c_cyan, $$1, c_reset, c_yellow, $$2, c_reset}' $(MAKEFILE_LIST)

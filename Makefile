.PHONY: help prettify check-prettify fix-trailing-whitespace check-trailing-whitespace build-example serve-example test

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2}'

prettify: ## Format files with Prettier (includes markdown wrapping at 80 chars)
	@if [ -f package.json ]; then \
		npx prettier --write 'leakix-dark/**/*.{html,scss,css,js}' \
			'exampleSite/content/**/*.md' \
			'*.{json,md}' \
			'.github/**/*.yml' \
			--ignore-path .prettierignore; \
	else \
		echo "package.json not found. Run 'npm install' first."; \
	fi

check-prettify: ## Check if files are formatted with Prettier
	@if [ -f package.json ]; then \
		npx prettier --check 'leakix-dark/**/*.{html,scss,css,js}' \
			'exampleSite/content/**/*.md' \
			'*.{json,md}' \
			'.github/**/*.yml' \
			--ignore-path .prettierignore; \
	else \
		echo "package.json not found. Run 'npm install' first."; \
	fi

fix-trailing-whitespace: ## Fix trailing whitespace in all files
	@echo "Fixing trailing whitespace..."
	@find . -type f \( -name "*.md" -o -name "*.html" -o -name "*.scss" \
		-o -name "*.css" -o -name "*.js" -o -name "*.json" \
		-o -name "*.toml" -o -name "*.yml" -o -name "*.yaml" \
		-o -name "*.go" -o -name "*.sh" \) \
		-not -path "./node_modules/*" \
		-not -path "./.git/*" \
		-not -path "./public/*" \
		-not -path "./resources/*" \
		-not -path "./exampleSite/public/*" \
		-not -path "./exampleSite/resources/*" \
		-exec sed -i 's/[[:space:]]*$$//' {} +
	@echo "Trailing whitespace fixed!"

check-trailing-whitespace: ## Check for trailing whitespace in all files
	@echo "Checking for trailing whitespace..."
	@! find . -type f \( -name "*.md" -o -name "*.html" -o -name "*.scss" \
		-o -name "*.css" -o -name "*.js" -o -name "*.json" \
		-o -name "*.toml" -o -name "*.yml" -o -name "*.yaml" \
		-o -name "*.go" -o -name "*.sh" \) \
		-not -path "./node_modules/*" \
		-not -path "./.git/*" \
		-not -path "./public/*" \
		-not -path "./resources/*" \
		-not -path "./exampleSite/public/*" \
		-not -path "./exampleSite/resources/*" \
		-exec grep -l '[[:space:]]$$' {} + || \
		(echo "✓ No trailing whitespace found" && exit 0)

build-example: ## Build the example site
	@echo "Checking Go version..."
	@go version | grep -q "go1.2[4-9]" || (echo "Error: Go 1.24 or higher is required" && exit 1)
	@if command -v hugo >/dev/null 2>&1; then \
		echo "Using existing Hugo: $$(hugo version)"; \
	else \
		echo "Installing Hugo with Go..."; \
		go install -tags extended github.com/gohugoio/hugo@v0.150.1; \
	fi
	@echo "Building example site..."
	@cd exampleSite && hugo --themesDir .. --baseURL="https://leakix.github.io/hugo-leakix-dark/"

serve-example: ## Serve the example site locally
	@echo "Checking Go version..."
	@go version | grep -q "go1.2[4-9]" || (echo "Error: Go 1.24 or higher is required" && exit 1)
	@if command -v hugo >/dev/null 2>&1; then \
		echo "Using existing Hugo: $$(hugo version)"; \
	else \
		echo "Installing Hugo with Go..."; \
		go install -tags extended github.com/gohugoio/hugo@v0.150.1; \
	fi
	@echo "Starting Hugo server for example site..."
	@cd exampleSite && hugo server --themesDir .. --buildDrafts --disableFastRender

test: ## Run all checks
	@echo "Running all checks..."
	@$(MAKE) check-trailing-whitespace
	@$(MAKE) check-prettify
	@$(MAKE) build-example
	@echo "✓ All checks passed!"

install-deps: ## Install npm dependencies
	@echo "Installing dependencies..."
	@npm install
	@echo "✓ Dependencies installed!"

cancel-long-runs: ## Cancel CI runs longer than 2 minutes
	@./scripts/cancel-long-runs.sh

clean: ## Clean build artifacts
	@echo "Cleaning build artifacts..."
	@rm -rf exampleSite/public exampleSite/resources
	@rm -rf node_modules
	@echo "✓ Clean complete!"
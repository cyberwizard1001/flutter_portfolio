# Makefile for deploying the Flutter web projects to GitHub

GITHUB_USER = cyberwizard1001
GITHUB_REPO_BASE = https://github.com/$(GITHUB_USER)
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

# Deploy the Flutter web project to GitHub
deploy:
ifndef OUTPUT
	$(error OUTPUT is not set. Usage: make deploy OUTPUT=<output_repo_name>)
endif

	$(eval GITHUB_REPO := $(GITHUB_REPO_BASE)/$(OUTPUT).git)

	@echo "Clean existing repository"
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Generating the web folder..."
	flutter create . --platforms web

	@echo "Building for web..."
	flutter build web --release

	@echo "Deploying to git repository"
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u -f origin main

	@echo "✅ Finished deploying $(GITHUB_REPO)"
	@echo "🚀 URL: https://$(GITHUB_USER).github.io/"

.PHONY: deploy

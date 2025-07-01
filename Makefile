# Makefile for deploying Flutter web app to GitHub Pages
# Update these variables
BASE_HREF = '/'
GITHUB_REPO = git@github.com:walterduesing85/terratrace.git
BUILD_VERSION = $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
	@echo "Clean existing repository..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Building web app..."
	flutter build web --web-renderer html --base-href $(BASE_HREF) --release --dart-define=FLUTTER_WEB_USE_SKIA=true --dart-define=FLUTTER_WEB_AUTO_DETECT=true

	@echo "Deploying to git repository..."

	cd build/web && \
	git init && \
	git remote add origin $(GITHUB_REPO) && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M main && \
	git push -u --force origin main

	cd ../..

	@echo "Deploy finished."

.PHONY: deploy-web

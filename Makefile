BASE_HREF = '/'
BUILD_VERSION = $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')
BRANCH = main

deploy-ionos:
	@echo "🔄 Cleaning project..."
	flutter clean

	@echo "📦 Getting Flutter packages..."
	flutter pub get

	@echo "🛠️  Building Flutter web app..."
	flutter build web --web-renderer html --base-href $(BASE_HREF) --release

	@echo "✅ Committing updated source code..."
	git add .
	git commit -m "Deploy version $(BUILD_VERSION)"
	git push origin $(BRANCH)

	@echo "🚀 Deployment triggered on IONOS (via GitHub push)."

.PHONY: deploy-ionos

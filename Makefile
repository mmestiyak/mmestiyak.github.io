.PHONY: build serve deploy css css-watch clean check help log moment build-full

help: ## Show this command list
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

serve: ## Start local dev server
	hugo server --disableFastRender

build: ## Build site for production
	hugo --minify --gc

deploy: ## Build and print deploy instructions
	$(MAKE) build
	@echo ""
	@echo "✅ Build complete. Deploy happens automatically on git push."
	@echo "   git push origin master"

check: ## Print build stats and warn on broken internal refs
	hugo --printPathWarnings --printUnusedTemplates

log: ## New log post: make log t="My post title"
	@test -n "$(t)" || { echo 'usage: make log t="My post title"'; exit 1; }
	@slug=`printf '%s' "$(t)" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$$//'`; \
	d=`date +%Y-%m-%d`; \
	f="content/logs/$$slug.md"; \
	test ! -e "$$f" || { echo "already exists: $$f"; exit 1; }; \
	printf '+++\ntitle = "%s"\ndate = "%s"\ndescription = ""\ntags = []\ntopics = []\n+++\n\nWrite here.\n' "$(t)" "$$d" > "$$f"; \
	echo "created $$f"

moment: ## New photo moment: make moment t="Caption title" (then drop photos in the folder)
	@test -n "$(t)" || { echo 'usage: make moment t="Caption title"'; exit 1; }
	@slug=`printf '%s' "$(t)" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$$//'`; \
	d=`date +%Y-%m-%d`; \
	dir="content/moments/$$d-$$slug"; \
	test ! -e "$$dir" || { echo "already exists: $$dir"; exit 1; }; \
	mkdir -p "$$dir"; \
	printf '+++\ntitle = "%s"\ndate = "%s"\ntags = []\ntopics = []\n+++\n\nCaption goes here (optional).\n' "$(t)" "$$d" > "$$dir/index.md"; \
	echo "created $$dir"; \
	echo "→ now drop your photo(s) in that folder (any size — Hugo resizes them)"

clean: ## Remove build artifacts and the image cache
	rm -rf public resources

# --- Tailwind CLI pipeline (compiled CSS, no CDN) ---
# assets/css/tailwind.css is committed because CI does not run npm.
# After changing Tailwind classes in layouts/, run `make css` and commit it.

css: ## Build Tailwind CSS (requires npm install first)
	npx tailwindcss -i ./src/input.css -o ./assets/css/tailwind.css --minify

css-watch: ## Watch and rebuild Tailwind CSS
	npx tailwindcss -i ./src/input.css -o ./assets/css/tailwind.css --watch

build-full: css build ## Full build (CSS + Hugo)

.PHONY: build serve deploy css css-watch clean check help log moment

help: ## Show this command list
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

serve: ## Start local dev server (uses committed static/tailwind.css)
	zola serve

build: ## Build site for production
	zola build

deploy: ## Build and print deploy instructions
	$(MAKE) build
	@echo ""
	@echo "✅ Build complete. Deploy happens automatically on git push."
	@echo "   git push origin master"

check: ## Check site for broken links and validation issues
	zola check

log: ## New log post: make log t="My post title"
	@test -n "$(t)" || { echo 'usage: make log t="My post title"'; exit 1; }
	@slug=`printf '%s' "$(t)" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$$//'`; \
	d=`date +%Y-%m-%d`; \
	f="content/logs/$$slug.md"; \
	test ! -e "$$f" || { echo "already exists: $$f"; exit 1; }; \
	printf '+++\ntitle = "%s"\ndate = %s\ndescription = ""\n[taxonomies]\ntags = []\ntopics = []\n+++\n\nWrite here.\n' "$(t)" "$$d" > "$$f"; \
	echo "created $$f"

moment: ## New photo moment: make moment t="Caption title" (then drop photos in the folder)
	@test -n "$(t)" || { echo 'usage: make moment t="Caption title"'; exit 1; }
	@slug=`printf '%s' "$(t)" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$$//'`; \
	d=`date +%Y-%m-%d`; \
	dir="content/moments/$$d-$$slug"; \
	test ! -e "$$dir" || { echo "already exists: $$dir"; exit 1; }; \
	mkdir -p "$$dir"; \
	printf '+++\ntitle = "%s"\ndate = %s\n[taxonomies]\ntags = []\ntopics = []\n+++\n\nCaption goes here (optional).\n' "$(t)" "$$d" > "$$dir/index.md"; \
	echo "created $$dir"; \
	echo "→ now drop your photo(s) into that folder (photo.jpg, 01.jpg 02.jpg ...)"

clean: ## Remove build artifacts
	rm -rf public

# --- Tailwind CLI pipeline (the site uses compiled CSS, no CDN) ---
# static/tailwind.css is committed. After changing any Tailwind classes in
# templates/, run `make css` and commit the regenerated file.

css: ## Build Tailwind CSS (requires npm install first)
	npx tailwindcss -i ./src/input.css -o ./static/tailwind.css --minify

css-watch: ## Watch and rebuild Tailwind CSS
	npx tailwindcss -i ./src/input.css -o ./static/tailwind.css --watch

build-full: css build ## Full build (CSS + Zola) for compiled Tailwind
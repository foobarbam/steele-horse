.PHONY: clean serve

all: build

clean:
	rm -rf hugo/public

hugo/public:
	cd hugo && hugo

build: clean hugo/public

serve: clean
	cd hugo && hugo serve -D --contentDir content/

plan: build
	cd terraform && terraform plan

apply: build
	cd terraform && terraform apply

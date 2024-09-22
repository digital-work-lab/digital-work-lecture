UID := $(shell id -u)
GID := $(shell id -g)
LANG := "en_CA.UTF-8"

LATEX_REF_DOC = --template /assets/basic.tex

PANDOC_CALL = docker run --rm \
	--volume "`pwd`:/data" \
	--volume "$(shell readlink -f ./assets)":/assets/ \
	--user $(shell id -u):$(shell id -g) \
	pandoc/ubuntu-latex

SLIDES_LIST := $(patsubst %.md,%,$(wildcard [0-9][0-9]*.md))

TEACHING_NOTES_LIST := $(patsubst teaching_notes/%.md,%,$(wildcard teaching_notes/[0-9][0-9]*.md))

# Define a rule to build all slides
slides: lecture_slides lecture_slides_pdfs teaching_notes

# convert_pdfs

lecture_slides: $(addprefix output/,$(addsuffix .html,$(SLIDES_LIST)))

lecture_slides_pdfs: $(addprefix output/,$(addsuffix .pdf,$(SLIDES_LIST)))

# Define a rule to build all teaching notes
teaching_notes: $(addprefix output/teaching_notes/,$(addsuffix .html,$(TEACHING_NOTES_LIST)))

# convert_pdfs:
# 	python scripts/html_to_pdf.py

# Define a pattern rule for building a slide
output/%.html: %.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli:v3.4.0 $< --theme-set assets/theme.css --html --allow-local-files -o $@

# Define a pattern rule for building a slide
# output/%.pdf: %.md assets/theme.css
# 	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli:v3.4.0 $< --theme-set assets/theme.css --pdf --allow-local-files -o $@

# output/%.pdf: %.md assets/theme.css
# 	docker run --rm --init -v "$(PWD)":/home/marp/app/ -v "$(PWD)/assets":/home/marp/app/assets -v "$(PWD)/material":/home/marp/app/material -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli:v3.4.0 /home/marp/app/$< --theme-set /home/marp/app/assets/theme.css --pdf --allow-local-files -o /home/marp/app/$@

output/%.pdf: %.md assets/theme.css
	docker run --rm --init -v "$(shell pwd)":/home/marp/app/ -v "$(shell pwd)/assets":/home/marp/app/assets -v "$(shell pwd)/material":/home/marp/app/material -e LANG=$(LANG) -e MARP_USER=$(shell id -u):$(shell id -g) marpteam/marp-cli:v3.4.0 /home/marp/app/$< --theme-set /home/marp/app/assets/theme.css --pdf --allow-local-files -o /home/marp/app/output/$@


# Define a pattern rule for building a teaching note
output/teaching_notes/%.html: teaching_notes/%.md assets/theme.css
	mkdir -p output/teaching_notes && \
	$(PANDOC_CALL) \
        $< \
        --filter pandoc-crossref \
        --citeproc \
        --output $@

UID := $(shell id -u)
GID := $(shell id -g)
LANG := "en_CA.UTF-8"

LATEX_REF_DOC = --template /assets/basic.tex

PANDOC_CALL = docker run --rm \
	--volume "`pwd`:/data" \
	--volume "$(shell readlink -f ./assets)":/assets/ \
	--user `id -u`:`id -g` \
	pandoc/ubuntu-latex

run : slides

slides: output/00-orga.html output/01-drivers-of-change.html output/02-basics-of-individual-work.html output/03-personal-information-management.html output/04-excellence.html output/05-remote-teams.html output/06-communication.html output/07-collaborative-content-creation.html output/08-open-source.html output/09-platformization.html output/10-knowledge-intensive-services.html output/11-futures.html output/11-futures-notes.html output/12-ethics-notes.html output/12-ethics.html output/13-exam-prep.html output/teaching_notes/02_gtd.html

output/00-orga.html: 00-orga.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 00-orga.md --theme-set assets/theme.css --html --allow-local-files -o output/00-orga.html

output/01-drivers-of-change.html: 01-drivers-of-change.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 01-drivers-of-change.md --theme-set assets/theme.css --html --allow-local-files -o output/01-drivers-of-change.html

output/02-basics-of-individual-work.html: 02-basics-of-individual-work.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 02-basics-of-individual-work.md --theme-set assets/theme.css --html --allow-local-files -o output/02-basics-of-individual-work.html

output/03-personal-information-management.html: 03-personal-information-management.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 03-personal-information-management.md --theme-set assets/theme.css --html --allow-local-files -o output/03-personal-information-management.html

output/04-excellence.html: 04-excellence.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 04-excellence.md --theme-set assets/theme.css --html --allow-local-files -o output/04-excellence.html

output/05-remote-teams.html: 05-remote-teams.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 05-remote-teams.md --theme-set assets/theme.css --html --allow-local-files -o output/05-remote-teams.html

output/06-communication.html: 06-communication.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 06-communication.md --theme-set assets/theme.css --html --allow-local-files -o output/06-communication.html

output/07-collaborative-content-creation.html: 07-collaborative-content-creation.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 07-collaborative-content-creation.md --theme-set assets/theme.css --html --allow-local-files -o output/07-collaborative-content-creation.html

output/08-open-source.html: 08-open-source.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 08-open-source.md --theme-set assets/theme.css --html --allow-local-files -o output/08-open-source.html

output/09-platformization.html: 09-platformization.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 09-platformization.md --theme-set assets/theme.css --html --allow-local-files -o output/09-platformization.html

output/10-knowledge-intensive-services.html: 10-knowledge-intensive-services.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 10-knowledge-intensive-services.md --theme-set assets/theme.css --html --allow-local-files -o output/10-knowledge-intensive-services.html

output/11-futures.html: 11-futures.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 11-futures.md --theme-set assets/theme.css --html --allow-local-files -o output/11-futures.html

output/11-futures-notes.html: 11-futures-notes.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 11-futures-notes.md --theme-set assets/theme.css --html --allow-local-files -o output/11-futures-notes.html

output/12-ethics.html: 12-ethics.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 12-ethics.md --theme-set assets/theme.css --html --allow-local-files -o output/12-ethics.html

output/12-ethics-notes.html: 12-ethics-notes.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 12-ethics-notes.md --theme-set assets/theme.css --html --allow-local-files -o output/12-ethics-notes.html

output/13-exam-prep.html: 13-exam-prep.md assets/theme.css
	docker run --rm --init -v "$(PWD)":/home/marp/app/ -e LANG=${LANG} -e MARP_USER="${UID}:${GID}" marpteam/marp-cli 13-exam-prep.md --theme-set assets/theme.css --html --allow-local-files -o output/13-exam-prep.html

output/teaching_notes/02_gtd.html: teaching_notes/02_gtd.md
	$(PANDOC_CALL) \
		teaching_notes/02_gtd.md \
		--filter pandoc-crossref \
		--citeproc \
		--output output/teaching_notes/02_gtd.html
# Digital work lecture

TODO
- copy material (figures)
- Makefile
- create slides in /output/ directory?
- pre-commit hooks
- copyright
- remove random materials and publish

https://github.com/aheil/hhn-webdev
https://github.com/aheil/hhn-webdev/blob/main/.github/workflows/main.yml

- check watch mode: https://hub.docker.com/r/marpteam/marp-cli/

Slides / concept
- [ ] Structure each lecture into 3-4 parts
- [ ] Slides in English?
- [ ] Mentimeter use cases?
- [ ] Interactive elements/humor
- [ ] Add options to shorten/extend (depending on the timing)

- [ ] Prepare an overarching recap for the end of the course

Exercises
- [ ] Übungsinhalte (brainstorm)
- [ ] Requirements: bring a laptop to the sessions (or team-up with a fellow student)?
- [ ] Have students read one or two journal/research papers (mandatory readings)
- [ ] Make sure every exercise/homework is discussed
- [ ] Tutorials: discuss and research in teams

Bonus [[Bonus point exercises]]
- [ ] Bonuspunkte: jede Leistung muss Quellenangaben und eine Abbildung/Illustration enthalten
- [ ] Bonusleistungen entwerfen (VC-Upload vorbereiten?, auch für Unterrichtsbeiträge?, LT: nicht zu viele Leistungen/Aufwand)
- [ ] VL: Bonuspunkte: Kurzpräsentationen des eigenen Arbeitsorganisationssystems/Apps/Prinzipien (3-5 min - prep in the break)
- [ ] Start with three exercises (maybe assign points for participation?)

Exam ([[Exams]])
- [ ] Klausurnahe Aufgaben angeben (später ggf. Probeklausur bereitstellen)


- [ ] TODO : check related courses, e.g., in Copenhagen?
- [ ] Ggf. Gastvorträge organisieren?

To build the slides run

```
make slides
```

Note : with html/the presenter mode, comments are displayed on the second screen

<!-- 
docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG -e MARP_USER="$(id -u):$(id -g)" marpteam/marp-cli lecture_0_orga.md --theme-set theme.css --html --allow-local-files
docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG -e MARP_USER="$(id -u):$(id -g)" marpteam/marp-cli lecture_1_Introduction_Drivers_of_change_in_digital_work.md --theme-set theme.css --html --allow-local-files

docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG -e MARP_USER="$(id -u):$(id -g)" marpteam/marp-cli lecture_0_orga.md --theme-set theme.css --pdf --allow-local-files
docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG -e MARP_USER="$(id -u):$(id -g)" marpteam/marp-cli lecture_1_Introduction_Drivers_of_change_in_digital_work.md --theme-set theme.css --pdf --allow-local-files

docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG -e MARP_USER="$(id -u):$(id -g)" marpteam/marp-cli short_overview.md --theme-set theme.css --pdf --allow-local-files
docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG -e MARP_USER="$(id -u):$(id -g)" marpteam/marp-cli short_overview.md --theme-set theme.css --html --allow-local-files
docker run --rm --init -v $PWD:/home/marp/app/ -e LANG=$LANG -e MARP_USER="$(id -u):$(id -g)" marpteam/marp-cli short_overview.md --theme-set theme.css --pptx --allow-local-files
 -->


<!-- 
Goal:
- grow/develop your system and share insights
- don't just observe the world, but understand methods

At some point: consider developing an open-source textbook (Blair Wang may be interested)

Perspectives: theory, method/techniques (skills), design, policy
Manage expectations: selection of topics (ask students for gaps/additions at the end?)
Adopt different perspectives: students as... a digital worker, a work manager, a designer of work technology, a regulator, ... (in a traditional organization or in a new/emergent form)
TBD: "Work with technology" is part of all areas?

- my role: not a lexicon, but facilitating discourse, ideally you can provide feedback (how: link)
-> Goal: toolkit for graduate students (we are particularly interested in the design areas - the ones that we can influence)
-> Individual experimentation mindset (especially when the state of the evidence is complicated)
-> dissoticate: which tools/techniques are appropriate for specific situations, what are the underlying mechanisms, the corresponding evidence, associated tools (theories)
-> under which circumstances can the methods be applied, how should users be trained?
-> Was macht die Praxis (als valide Frage)? Was wären bessere Optionen? (Bescheidenheit ist für Wissenschaft und Praxis angebracht)
--> 



## Plan to develop the lecture

[[IDW TODO]]

## Overarching learning objectives

- Understand the historical, organizational, and societal drivers of change in digital work.
- Familiarize with a repertoire of techniques, methods, and policies for effective digital work at the levels of individuals, teams, and crowds.
- Apply, adapt, and critically discuss these methods in different practical contexts
- Appreciate different forms of scientific knowledge, theories, and methods prevalent in research on digital work

## Structure
[[short_overview]]
[[Lecture-0-Orga]]
[[Lecture-1-Drivers-of-change]]

[[lecture_2_Digital_work_individually_Basics_of_individual_digital_work]]
[[lecture_3_Digital_work_individually__The_digital_workplace]]
[[lecture_4_Digital_work_individually_Excellence_in_digital_work]]

[[lecture_5_Digital_work_in_teams_Remote_teams]]
[[lecture_6_Digital_work_in_teams_Communication]]
[[lecture_7_Digital_work_in_teams_Collaborative_content_creation]]

[[lecture_8_Digital_work_with_crowds_Open_source_workflows]]
[[lecture_9_Digital_work_with_crowds_Types_of_digital_platforms]]
[[lecture_10_Digital_work_with_crowds_Sourcing_digital_work_from_platforms]]

[[lecture_11_Digital_work_and_its_futures_Humans_vs._machines]]
[[lecture_12_Digital_work_and_its_futures_Managing_unintended_consequences]]

[[lecture_13_Recap_and_exam_preparations]]

## Materials

similar to [the udemy course](https://www.udemy.com/course/29-big-ideas-for-getting-things-done/learn/lecture/26821690#overview):
- session structure: start with key idea, provide applications/details, and close with action items

Related courses:
- [[UNSW INFS102 Working in digital ecosystems]]
- [[VHB New Work]]

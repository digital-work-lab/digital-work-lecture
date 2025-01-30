import re
import os

header = """---
marp: true
header: 'Learn Markers'
theme: ub-theme
paginate: true
---

"""

toc = []  # Table of contents storage
structured_slides = {}  # Dictionary to store slides under their headers


def extract_header(file_content):
    """Extract the 'header' field from YAML front matter."""
    match = re.search(r"^header:\s*['\"]?(.*?)['\"]?$", file_content, re.MULTILINE)
    return match.group(1) if match else "Miscellaneous"  # Default category


def extract_must_learn_slides(file_path):
    """Extract slides with <!-- _class: must_learn -->"""
    with open(file_path, "r", encoding="utf-8") as file:
        content = file.read()

    section_header = extract_header(content)
    slides = re.split(r"(?=\n---)", content)
    must_learn_slides = [slide for slide in slides if "<!-- _class: must_learn -->" in slide]

    return section_header, must_learn_slides


def save_extracted_slides(slides_dict, output_file):
    """Save extracted slides, grouped by header, with a table of contents."""
    if os.path.exists(output_file):
        os.remove(output_file)

    with open(output_file, "w", encoding="utf-8") as file:
        file.write(header)

        # Generate Table of Contents
        file.write("\n## Table of Contents\n\n")
        for section, slides in slides_dict.items():
            if slides: 
                anchor = section.lower().replace(" ", "-")
                file.write(f"- [{section}](#{anchor})\n")

        for section, slides in slides_dict.items():
            if slides:
                anchor = section.lower().replace(" ", "-")

                file.write(f"\n---\n\n## {section} <a id='{anchor}'></a>")
                file.write("\n\n---\n\n".join(slide.lstrip("\n---") for slide in slides))

    print(f"Extracted slides structured under headers and saved to {output_file}")


if __name__ == "__main__":

    extracted_slides = []
    structured_slides = {}
    # iterate over md files in slides dir
    for file in os.listdir("slides"):
        if file in ["00-orga.md", "00_learn_markers.md"]:
            continue

        print(file)
        if file.endswith(".md"):
            input_file = f"slides/{file}"
            section_header, slides = extract_must_learn_slides(input_file)

            if section_header not in structured_slides:
                structured_slides[section_header] = []

            structured_slides[section_header].extend(slides)

    structured_slides = dict(sorted(
        structured_slides.items(),
        key=lambda x: int(re.search(r'\d+', x[0]).group()) if re.search(r'\d+', x[0]) else float('inf')
    ))

    output_file = f"slides/00_learn_markers.md"
    save_extracted_slides(structured_slides, output_file)


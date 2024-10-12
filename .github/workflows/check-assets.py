import os
import re
from pathlib import Path

# Define project root as two levels above the script's location
project_root = Path(__file__).resolve().parents[2]
markdown_dir = Path('slides')  # Directory containing markdown files
assets_dir = Path('assets')  # Directory containing assets
ignore_file = project_root / '.github/workflows/.asset_ignore.txt'  # Path to the .asset_ignore.txt file

# Regex pattern to find asset links in markdown files
asset_link_pattern = re.compile(r'!\[.*?\]\((.*?)\)')

# GitHub repo and branch for generating the link
GITHUB_REPOSITORY = os.getenv('GITHUB_REPOSITORY', 'your-username/your-repo')
BRANCH = os.getenv('GITHUB_REF_NAME', 'main')

def load_ignored_assets(ignore_file):
    if not ignore_file.exists():
        return set()
    
    with open(ignore_file, 'r', encoding='utf-8') as f:
        ignored_paths = {line.strip() for line in f if line.strip()}
    
    return ignored_paths

def find_linked_assets(markdown_dir):
    linked_assets = set()
    
    # Walk through all markdown files
    for root, _, files in os.walk(markdown_dir):
        for file in files:
            if file.endswith('.md'):
                filepath = Path(root) / file
                with open(filepath, 'r', encoding='utf-8') as f:
                    content = f.read()
                    # Find all asset links in the markdown file
                    links = asset_link_pattern.findall(content)
                    for link in links:
                        # Convert to absolute path if necessary and normalize
                        asset_path = (Path(root) / link).resolve()
                        # Calculate the relative path from the project root
                        try:
                            rel_asset_path = os.path.relpath(asset_path, project_root)
                        except ValueError:
                            rel_asset_path = asset_path  # Fallback to absolute path if unable to calculate relative path
                        linked_assets.add(rel_asset_path)
    
    return linked_assets

def find_all_assets(assets_dir):
    all_assets = set()
    
    # Walk through all files in the assets directory
    for root, _, files in os.walk(assets_dir):
        for file in files:
            asset_path = Path(root) / file
            # Calculate the relative path from the project root
            try:
                rel_asset_path = os.path.relpath(asset_path, project_root)
            except ValueError:
                rel_asset_path = asset_path  # Fallback to absolute path if unable to calculate relative path
            all_assets.add(rel_asset_path)
    
    return all_assets

def find_dangling_assets():
    # Find all linked assets
    linked_assets = find_linked_assets(markdown_dir)
    
    # Find all files in the assets directory
    all_assets = find_all_assets(assets_dir)

    # Load ignored assets
    ignored_assets = load_ignored_assets(ignore_file)

    # Identify the dangling assets
    dangling_assets = all_assets - linked_assets - ignored_assets
    
    return dangling_assets

if __name__ == "__main__":
    dangling_assets = find_dangling_assets()
    
    dangling_assets_file = Path('dangling_assets.md')  # File to store broken links
    
    edit_ignore_file_link = f"../edit/{BRANCH}/.github/workflows/.asset_ignore.txt"
    
    if dangling_assets:
        print("Dangling assets found:")
        with dangling_assets_file.open('w', encoding='utf-8') as f:
            f.write("## Dangling Assets:\n") 
            for asset in dangling_assets:
                print(asset)
                f.write(f"- `{asset}`\n")
            f.write("\n---\n")
            f.write(f"To ignore any of these assets, edit the [.asset_ignore.txt]({edit_ignore_file_link}) file directly on GitHub.\n")
    else:
        print("No dangling assets found.")

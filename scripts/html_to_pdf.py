import os
import asyncio
from pyppeteer import launch

async def generate_pdf_from_html(html_content, pdf_path):
    browser = await launch()
    page = await browser.newPage()
    
    await page.setContent(html_content)
    
    await page.pdf({'path': pdf_path, 'format': 'A4'})
    
    await browser.close()

# Directory path
directory = 'output/'

# Change current working directory
os.chdir(directory)

# Iterate over html files in the directory
for filename in os.listdir("."):
    if filename.endswith('.html'):
                
        # Read html content from file
        with open(filename, 'r') as file:
            html_content = file.read()
        
        # Generate pdf
        pdf_path = f'{filename}.pdf'
        asyncio.get_event_loop().run_until_complete(generate_pdf_from_html(html_content, pdf_path))



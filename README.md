# Winter Catalogue 2025 - Product Signs

This repository contains a simple HTML page designed to work with the [InDesign HTML Import Script](https://www.id-extras.com/html-import-script/) for creating product catalogues.

## Setup Instructions

### 1. GitHub Pages Setup

1. **Create a new GitHub repository** (if you haven't already)
2. **Upload the files** to your repository:
   - `index.html` (the main catalogue page)
   - `README.md` (this file)
3. **Enable GitHub Pages**:
   - Go to your repository settings
   - Scroll down to "Pages" section
   - Select "Deploy from a branch"
   - Choose "main" branch and "/ (root)" folder
   - Click "Save"
4. **Wait for deployment** (usually takes a few minutes)
5. **Get your URL**: Your page will be available at `https://[your-username].github.io/[repository-name]`

### 2. Using with InDesign HTML Import Script

1. **Download the InDesign HTML Import Script** from [id-extras.com](https://www.id-extras.com/html-import-script/)
2. **Install the script** in InDesign following their instructions
3. **Open the HTMLTemplate.indd file** (included with the script)
4. **Run the script** and paste your GitHub Pages URL
5. **The script will import** all the product codes and structure into InDesign

## File Structure

```
├── index.html          # Main catalogue page
├── README.md           # This file
└── Data/
    └── GeneralOnHill-1.csv  # Original product data
```

## Customization

### Adding Real Images

To replace the placeholder images with actual product images:

1. **Convert your PDFs to images** (JPG, PNG, or WebP format)
2. **Upload the images** to your GitHub repository
3. **Update the HTML** to reference the actual image files:

```html
<!-- Replace this: -->
<div class="product-image">H160</div>

<!-- With this: -->
<img src="images/H160.jpg" alt="H160 Product" class="product-image">
```

### Styling Changes

The page uses CSS Grid for responsive layout. You can modify the styles in the `<style>` section of `index.html` to match your brand colors and design preferences.

## Product Codes Included

The catalogue includes all 78 product codes from H100 to H225, with special variants like H102B.

## Notes

- The current version uses placeholder images since the original files are PDFs
- The InDesign script will import the text structure and styling
- You can add real images later by updating the HTML file
- The page is responsive and works on mobile devices

## Support

For issues with the InDesign HTML Import Script, visit [id-extras.com](https://www.id-extras.com/html-import-script/).

For GitHub Pages issues, check the [GitHub Pages documentation](https://pages.github.com/). 
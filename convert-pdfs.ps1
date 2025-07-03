# PowerShell script to convert PDFs to images
# This script will help convert PDF files to JPG format for web display

Write-Host "PDF to Image Converter for Winter Catalogue 2025" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green

# Create images directory if it doesn't exist
$imagesDir = "images"
if (!(Test-Path $imagesDir)) {
    New-Item -ItemType Directory -Path $imagesDir
    Write-Host "Created images directory" -ForegroundColor Yellow
}

# Get all PDF files
$pdfFiles = Get-ChildItem -Path "SignsChange" -Filter "*.pdf"

Write-Host "Found $($pdfFiles.Count) PDF files to convert" -ForegroundColor Cyan

# Check if we have any conversion tools available
$hasImageMagick = $false
$hasGhostScript = $false

try {
    $magickVersion = & magick -version 2>$null
    if ($magickVersion) {
        $hasImageMagick = $true
        Write-Host "ImageMagick found - will use for conversion" -ForegroundColor Green
    }
} catch {
    Write-Host "ImageMagick not found" -ForegroundColor Yellow
}

try {
    $gsVersion = & gs --version 2>$null
    if ($gsVersion) {
        $hasGhostScript = $true
        Write-Host "Ghostscript found - will use for conversion" -ForegroundColor Green
    }
} catch {
    Write-Host "Ghostscript not found" -ForegroundColor Yellow
}

if (!$hasImageMagick -and !$hasGhostScript) {
    Write-Host "No PDF conversion tools found locally" -ForegroundColor Red
    Write-Host "Please install one of the following:" -ForegroundColor Yellow
    Write-Host "1. ImageMagick: https://imagemagick.org/script/download.php#windows" -ForegroundColor Cyan
    Write-Host "2. Ghostscript: https://www.ghostscript.com/releases/gsdnld.html" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Or use online conversion tools:" -ForegroundColor Yellow
    Write-Host "- https://www.ilovepdf.com/pdf_to_jpg" -ForegroundColor Cyan
    Write-Host "- https://smallpdf.com/pdf-to-jpg" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "After converting, place the JPG files in the 'images' folder" -ForegroundColor Yellow
    exit
}

# Convert PDFs to images
foreach ($pdf in $pdfFiles) {
    $outputName = $pdf.BaseName + ".jpg"
    $outputPath = Join-Path $imagesDir $outputName
    
    Write-Host "Converting $($pdf.Name) to $outputName..." -ForegroundColor White
    
    if ($hasImageMagick) {
        try {
            & magick -density 150 "$($pdf.FullName)[0]" -quality 90 "$outputPath"
            Write-Host "✓ Converted using ImageMagick" -ForegroundColor Green
        } catch {
            Write-Host "✗ Failed to convert with ImageMagick" -ForegroundColor Red
        }
    } elseif ($hasGhostScript) {
        try {
            & gs -sDEVICE=jpeg -dJPEGQ=90 -dNOPAUSE -dBATCH -dSAFER -r150 -sOutputFile="$outputPath" "$($pdf.FullName)"
            Write-Host "✓ Converted using Ghostscript" -ForegroundColor Green
        } catch {
            Write-Host "✗ Failed to convert with Ghostscript" -ForegroundColor Red
        }
    }
}

Write-Host ""
Write-Host "Conversion complete!" -ForegroundColor Green
Write-Host "Check the 'images' folder for converted JPG files" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Update the HTML file to use the JPG images instead of PDF links" -ForegroundColor White
Write-Host "2. Commit and push the changes to GitHub" -ForegroundColor White
Write-Host "3. Use the updated page with the InDesign HTML Import script" -ForegroundColor White 
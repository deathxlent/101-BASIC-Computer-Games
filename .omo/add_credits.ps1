# Script to add author credits to game HTML files
# Handles both multi-line (Type A) and single-line (Type B) footer formats

$gamesDir = "C:\ws\101-BASIC-Computer-Games\games"

# Author mapping (game name -> author) - from index.html
$authors = @{
    '1check' = 'David H. Ahl'
    '23mtch' = 'Bob Albrecht'
    'aceydu' = 'Bill Palmby'
    'amazin' = 'Jack Hauber'
    'animal' = 'Nathan Teichholtz'
    'awari' = 'Geoff Wyvill'
    'basbal' = 'Jack Huisman'
    'basbl1' = 'Jack Huisman'
    'basket' = 'Charles R. Bacheller'
    'batnum' = 'John Kemeny'
    'battle' = 'Ray Westergard'
    'blkjak' = 'Tom Kloos'
    'bomber' = 'David Sherman'
    'bowl' = 'Paul Peraino'
    'boxing' = 'Jesse Lynch'
    'bug' = 'Brian Leibowitz'
    'buleye' = 'David H. Ahl'
    'bull' = 'David Sweet'
    'bullcow' = 'Geoff Wyvill'
    'checkr' = 'Alan J. Segal'
    'chief' = 'John Graham'
    'chomp' = 'Peter Sessions'
    'civilw' = 'G. Paul, R. Hess'
    'craps' = 'Steve North'
    'cube' = 'Jerimac Ratliff'
    'dogs' = 'Victor Nahigian'
    'even1' = 'Eric Peters'
    'fipfop' = 'Michael Kass'
    'fotbal' = 'Raymond W. Miseyka'
    'furs' = 'Dan Bachor'
    'golf' = 'Howard Kargman'
    'gomoko' = 'Peter Sessions'
    'guess' = 'Walter J. Koetke'
    'gunner' = 'Tom Kloos'
    'hang' = 'Kenneth Aupperle'
    'hex' = 'Jeff Dalton'
    'hi-lo' = 'Dean Altman'
    'hi-q' = 'Charles Lund'
    'hmrabi' = 'David H. Ahl'
    'hockey' = 'Charles Buttrey'
    'hurkle' = 'Bob Albrecht'
    'kinema' = 'Richard Pav'
    'king' = 'James A. Storer'
    'life2' = 'Brian Wyvill'
    'litqz' = 'Pamela McGinley'
    'mnoply' = 'David Barker'
    'mugwump' = 'Bud Valenti'
    'nim' = 'Robert G. Cox'
    'number' = 'Tom Adametx'
    'orbit' = 'Jeff Lederer'
    'poker' = 'A. Christopher Hall'
    'reverse' = 'Peter Sessions, Bob Albrecht'
    'rocksp' = 'Charles Lund'
    'rusrou' = 'Tom Adametx'
    'salvo' = 'Lawrence Siegel'
    'salvo1' = 'Martin Burdash'
    'splat' = 'John F. Yegge'
    'synonm' = 'Walter J. Koetke'
    'target' = 'H. David Crockett'
    'tictac' = 'Tom Kloos'
    'tower' = 'Charles Lund'
    'train' = 'Walter J. Koetke'
    'ugly' = 'Mark Maslar'
    'war2' = 'Bob Dores'
    'word' = 'Charles Reid'
}

$total = 0
$updated = 0
$skipped = 0
$errors = @()

# Type B pattern (single-line footer)
$typeB_pattern = '<div class="terminal-footer"><span>101 BASIC COMPUTER GAMES</span><span>HTML EDITION</span></div></div>'

# Type A pattern (multi-line footer with 8-space indent)
# Use \n only (some files use LF, some use CRLF)
$typeA_nl = "`n"
$typeA_pattern = "        <div class=""terminal-footer"">$typeA_nl            <span>101 BASIC COMPUTER GAMES</span>$typeA_nl            <span>HTML EDITION</span>$typeA_nl        </div>"

foreach ($game in $authors.Keys) {
    $total++
    $author = $authors[$game]
    $filePath = Join-Path $gamesDir "$game.html"
    
    if (-not (Test-Path $filePath)) {
        $errors += "File not found: $game.html"
        $skipped++
        continue
    }
    
    $content = Get-Content $filePath -Raw
    
    # Check if already has credit
    if ($content -match 'terminal-credit') {
        $skipped++
        Write-Host "SKIP (already has credit): $game.html" -ForegroundColor Yellow
        continue
    }
    
    $creditLine = "<div class=""terminal-credit"">Written by: $author</div>"
    
    # Try Type A match first (multi-line)
    if ($content -match [regex]::Escape($typeA_pattern)) {
        $replacement = "$creditLine`r`n$typeA_pattern"
        $content = $content -replace [regex]::Escape($typeA_pattern), $replacement
        Set-Content -Path $filePath -Value $content -NoNewLine
        Write-Host "OK (Type A): $game.html -> $author" -ForegroundColor Green
        $updated++
    }
    # Try Type B match (single-line)
    elseif ($content -match [regex]::Escape($typeB_pattern)) {
        $replacement = "$creditLine`r`n$typeB_pattern"
        $content = $content -replace [regex]::Escape($typeB_pattern), $replacement
        Set-Content -Path $filePath -Value $content -NoNewLine
        Write-Host "OK (Type B): $game.html -> $author" -ForegroundColor Green
        $updated++
    }
    else {
        $errors += "No footer pattern found: $game.html"
        Write-Host "ERROR (no footer): $game.html" -ForegroundColor Red
        $skipped++
    }
}

Write-Host "=== Summary ===" -ForegroundColor Cyan
Write-Host "Total games with authors: $total" -ForegroundColor Cyan
Write-Host "Updated: $updated" -ForegroundColor Green
Write-Host "Skipped/Errors: $skipped" -ForegroundColor Yellow
if ($errors.Count -gt 0) {
    Write-Host "=== Errors ===" -ForegroundColor Red
    $errors | ForEach-Object { Write-Host "  $_" -ForegroundColor Red }
}

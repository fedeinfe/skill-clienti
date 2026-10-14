#!/bin/sh
# Stampa preventivo.html in PDF con Chrome headless: uso `build.sh <file.html>`.
set -e
html="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
pdf="${html%.html}.pdf"
chrome="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
[ -x "$chrome" ] || chrome="$(command -v google-chrome || command -v chromium)"
"$chrome" --headless=new --disable-gpu --no-pdf-header-footer \
  --virtual-time-budget=10000 --run-all-compositor-stages-before-draw \
  --print-to-pdf="$pdf" "file://$html" 2>/dev/null
echo "$pdf"

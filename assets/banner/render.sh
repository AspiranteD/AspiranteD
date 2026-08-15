#!/usr/bin/env bash
# Renders the banner HTML sources to PNG at 1584x396 (LinkedIn cover size) and @2x.
#   ./render.sh                     # renders every *-banner*.html in this directory
#   ./render.sh linkedin-banner.html
# Requires a Chromium binary and Python + Pillow.
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
CHROME="${CHROME:-/opt/pw-browsers/chromium-1194/chrome-linux/chrome}"
W=1584
H=396
SCALE=2
PAD=140   # headless window chrome offset, cropped away afterwards

sources=("$@")
if [ ${#sources[@]} -eq 0 ]; then
  sources=("$DIR"/*banner*.html)
fi

for src in "${sources[@]}"; do
  [ -f "$src" ] || { echo "skip: $src not found" >&2; continue; }
  base="$(basename "$src" .html)"

  "$CHROME" --headless --no-sandbox --disable-gpu --hide-scrollbars \
    --force-device-scale-factor="$SCALE" \
    --window-size="$W",$((H + PAD)) \
    --virtual-time-budget=3000 \
    --screenshot="$DIR/.raw.png" "$src" 2>/dev/null

  python3 - "$DIR" "$base" "$W" "$H" "$SCALE" <<'PY'
import sys
from PIL import Image

d, base, w, h, s = sys.argv[1], sys.argv[2], int(sys.argv[3]), int(sys.argv[4]), int(sys.argv[5])
img = Image.open(f"{d}/.raw.png").convert("RGB").crop((0, 0, w * s, h * s))
img.save(f"{d}/{base}@2x.png", optimize=True)
img.resize((w, h), Image.LANCZOS).save(f"{d}/{base}.png", optimize=True)
print(f"wrote {base}.png ({w}x{h}) and {base}@2x.png ({w*s}x{h*s})")
PY

  rm -f "$DIR/.raw.png"
done

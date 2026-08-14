#!/usr/bin/env bash
# Renders linkedin-banner.html to PNG at 1584x396 (LinkedIn cover size) and @2x.
# Requires a Chromium binary and Python + Pillow.
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
CHROME="${CHROME:-/opt/pw-browsers/chromium-1194/chrome-linux/chrome}"
W=1584
H=396
SCALE=2
PAD=140   # headless window chrome offset, cropped away afterwards

"$CHROME" --headless --no-sandbox --disable-gpu --hide-scrollbars \
  --force-device-scale-factor="$SCALE" \
  --window-size="$W",$((H + PAD)) \
  --virtual-time-budget=3000 \
  --screenshot="$DIR/.raw.png" "$DIR/linkedin-banner.html" 2>/dev/null

python3 - "$DIR" "$W" "$H" "$SCALE" <<'PY'
import sys
from PIL import Image

d, w, h, s = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4])
img = Image.open(f"{d}/.raw.png").convert("RGB").crop((0, 0, w * s, h * s))
img.save(f"{d}/linkedin-banner@2x.png", optimize=True)
img.resize((w, h), Image.LANCZOS).save(f"{d}/linkedin-banner.png", optimize=True)
print("wrote linkedin-banner.png (%dx%d) and linkedin-banner@2x.png (%dx%d)" % (w, h, w * s, h * s))
PY

rm -f "$DIR/.raw.png"

#!/usr/bin/env python3
"""Refit the Reusalia brand banner to LinkedIn's 1584x396 cover format.

The source artwork is 2000x667 (3:1). LinkedIn covers are 4:1, so the canvas is
cropped vertically — never stretched — around the artwork's own content, then
scaled down. Content bounds are measured rather than hard-coded, so a new export
of the source keeps working.

    python3 reusalia-fit.py [source.jpg] [out.png]
"""
import sys
from PIL import Image

SRC = sys.argv[1] if len(sys.argv) > 1 else "reusalia-source.jpg"
OUT = sys.argv[2] if len(sys.argv) > 2 else "reusalia-banner.png"
W_OUT, H_OUT = 1584, 396

im = Image.open(SRC).convert("RGB")
W, H = im.size
px = im.load()
bg = px[10, 10]


def differs(p, ref, tol=42):
    return sum(abs(a - b) for a, b in zip(p, ref)) > tol


rows = [y for y in range(H) if sum(1 for x in range(0, W, 4) if differs(px[x, y], bg)) > 6]
top, bottom = (rows[0], rows[-1]) if rows else (0, H - 1)
centre = (top + bottom) // 2

crop_h = round(W * H_OUT / W_OUT)          # 4:1 slice of the full width
if crop_h > H:                              # source is already wider than 4:1
    crop_h = H
y0 = max(0, min(centre - crop_h // 2, H - crop_h))

if y0 > top or y0 + crop_h < bottom:
    print(f"warning: crop {y0}-{y0 + crop_h} clips content {top}-{bottom}", file=sys.stderr)

out = im.crop((0, y0, W, y0 + crop_h)).resize((W_OUT, H_OUT), Image.LANCZOS)
out.save(OUT, optimize=True)
print(f"{OUT}: {W}x{H} → crop y{y0}-{y0 + crop_h} → {W_OUT}x{H_OUT}")

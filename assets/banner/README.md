# LinkedIn banner

Cover image for the LinkedIn profile, generated from HTML so the content stays editable.

| File | Size | Use |
|------|------|-----|
| `linkedin-banner.png` | 1584 × 396 | LinkedIn cover, English (recommended size) |
| `linkedin-banner-es.png` | 1584 × 396 | same banner, Spanish copy |
| `*@2x.png` | 3168 × 792 | retina / other surfaces (GitHub, portfolio, slides) |
| `linkedin-banner.html`, `linkedin-banner-es.html` | — | sources of truth |

Content is deliberately short: name, `CEO & Founder · Reusalia`, and one line — leading a
team of 5 and automating the operation with cutting-edge systems. The right column is the
career arc as four steps along a gradient spine: software engineer → entrepreneur → leading
my own company → systems and automation architect.

## Layout constraints

- The left 400 px hold only decorative graphics: LinkedIn drops the profile photo over
  the bottom-left corner (about 210 px wide in banner coordinates).
- All text lives between x = 404 and x = 1544, vertically centred, so nothing is clipped
  when LinkedIn crops the cover on narrow viewports.

## Regenerate

```bash
./render.sh                        # every banner source, needs Chromium + Python/Pillow
./render.sh linkedin-banner.html   # just one
CHROME=/path/to/chrome ./render.sh
```

Edit the HTML (text, metrics, colours) and re-run to regenerate the PNGs.

## Reusalia banner

The company banner refitted to LinkedIn's cover format — the brand artwork itself, not a rebuild.

| File | Notes |
|------|-------|
| `reusalia-source.jpg` | original artwork, 2000 × 667 |
| `reusalia-banner.png` | 1584 × 396, ready to upload |
| `reusalia-fit.py` | crops and scales one to the other |

The source is 3:1 and a LinkedIn cover is 4:1, so the script measures where the artwork's
content actually sits, crops the canvas vertically around it — never stretching — and scales
the result down. Re-run it after any new export:

```bash
python3 reusalia-fit.py                      # reusalia-source.jpg → reusalia-banner.png
python3 reusalia-fit.py other.jpg out.png
```

Output is capped by the source resolution, so there is no @2x for this one. If you have the
artwork at 3168 px wide or as a vector, drop it in and re-run for a retina version.

# LinkedIn banner

Cover image for the LinkedIn profile, generated from HTML so the content stays editable.

| File | Size | Use |
|------|------|-----|
| `linkedin-banner.png` | 1584 × 396 | LinkedIn cover, English (recommended size) |
| `linkedin-banner-es.png` | 1584 × 396 | same banner, Spanish copy |
| `*@2x.png` | 3168 × 792 | retina / other surfaces (GitHub, portfolio, slides) |
| `linkedin-banner.html`, `linkedin-banner-es.html` | — | sources of truth |

Content is deliberately short: name, `CEO & Founder · Reusalia`, and one line — leading a
team of 5 and automating the operation with cutting-edge systems. The right column carries
what that means in practice: marketplaces (12 accounts), AI automation (~40h/week saved),
PostgreSQL core (40K+ references) and the custom ERP (10+ modules).

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

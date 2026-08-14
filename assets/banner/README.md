# LinkedIn banner

Cover image for the LinkedIn profile, generated from HTML so the content stays editable.

| File | Size | Use |
|------|------|-----|
| `linkedin-banner.png` | 1584 × 396 | LinkedIn cover (recommended size) |
| `linkedin-banner@2x.png` | 3168 × 792 | retina / other surfaces (GitHub, portfolio, slides) |
| `linkedin-banner.html` | — | source of truth |

Content mirrors the profile: identity block on the left-centre, production stack on the
right (marketplaces → extraction + AI → PostgreSQL → ERP and warehouse) with the numbers
from `README.md` — 12 marketplace accounts, 40K+ inventory references, 10+ ERP modules,
60+ endpoints, 5-person team.

## Layout constraints

- The left 400 px hold only decorative graphics: LinkedIn drops the profile photo over
  the bottom-left corner (about 210 px wide in banner coordinates).
- All text lives between x = 404 and x = 1544, vertically centred, so nothing is clipped
  when LinkedIn crops the cover on narrow viewports.

## Regenerate

```bash
./render.sh          # needs Chromium + Python/Pillow
CHROME=/path/to/chrome ./render.sh
```

Edit `linkedin-banner.html` (text, metrics, colours) and re-run to produce both PNGs.

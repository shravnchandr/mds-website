# Shravan Chandra — Personal Website

Source repository for Shravan Chandra's personal website and blog, built with [Quarto](https://quarto.org/).

The site combines a personal homepage and About page with blog posts covering experiences during the Master of Data Science program and life in Vancouver.

## Repository structure

```text
.
├── _quarto.yml                 # Quarto website configuration
├── index.qmd                   # Homepage
├── about.qmd                   # About page
├── blog.qmd                    # Blog listing
├── data/                       # Blog post source files
│   └── IMDB_Movie_Data.csv     # Data backup
├── posts/                      # Blog post source files
│   ├── first-weeks/
│   │   ├── index.qmd
│   │   └── media/
│   ├── vancouver-day-out/
│   │   ├── index.qmd
│   │   └── media/
│   ├── python-post/
│   │   └── index.qmd
│   ├── python-r-post/
│   │   └── index.qmd
│   ├── r-post/
│   │   └── index.qmd
├── images/                     # Site-wide images
│   └── profile.jpeg
├── m3e.css                     # Material 3 Expressive-inspired site styling
├── styles.css                  # Additional/source stylesheet
├── uvr.toml                    # uvr project configuration
├── uvr.lock                    # Locked uvr environment/dependencies
├── docs/                       # Generated website output
└── README.md
```

## Website

The Quarto configuration defines this as a website project:

```yaml
project:
  type: website
  output-dir: docs
```

The navigation currently contains:

- **Home** — `index.qmd`
- **About** — `about.qmd`
- **Blog** — `blog.qmd`

The HTML format uses the Cosmo and brand themes with the custom `m3e.css` stylesheet:

```yaml
format:
  html:
    theme:
      - cosmo
      - brand
    css: m3e.css
    toc: true
```

## Content

### Homepage

`index.qmd` is the landing page. It introduces Shravan, his transition from five years as a Senior ML Engineer at Bosch to the Master of Data Science program at UBC, and what he is currently learning and exploring.

It also links visitors to the About page and blog.

### About

`about.qmd` contains a short personal history covering:

- Mysore
- Bangalore and Electrical Engineering at PES University
- Five years at Bosch
- Moving to Vancouver for the Master of Data Science at UBC
- Interest in accessibility-focused machine learning
- Travel, food, guitar, and Vancouver
- Topics Shravan is happy to discuss

### Blog

Blog posts live under `posts/`. Each post has its own directory containing an `index.qmd` source file and any media used by that post.

Current posts include:

- `posts/first-weeks/` — *My First Week in MDS*
- `posts/vancouver-day-out/` — *A Perfect Day in Vancouver*
- `posts/python-post/` — *IMDB Movie Analysis using Python*
- `posts/python-r-post/` — *IMDB Movie Analysis using Python & R*
- `posts/r-post/` — *IMDB Movie Analysis using R*

Post-specific images and video are kept alongside the post source in its `media/` directory.

## Data

`posts/python-post/index.qmd`, `posts/r-post/index.qmd` and `posts/python-r-post/index.qmd` both use the same IMDB dataset:

```text
https://raw.githubusercontent.com/prasertcbs/basic-dataset/refs/heads/master/IMDB_Movie_1000_Data.csv
```

Both posts read from this URL directly at render time. If there is no network access, they fall back to the local copy kept in `data/` instead, so the site can still render offline.

## Styling

The site uses `m3e.css` for a Material 3 Expressive-inspired visual language, **created with help of ChatGPT**.

The design direction is intentionally more playful than a standard Material implementation, using:

- Ocean-inspired colors
- Expressive typography and contrasting type sizes
- Organic and asymmetric shapes
- Light and dark theme support
- Subtle motion and hover states

The stylesheet is designed to work on top of the existing Quarto/Cosmo/brand theme rather than replacing Quarto's underlying framework.

## Local development

Make changes to the `.qmd`, CSS, image, or media source files rather than editing files inside `docs/`.

Set up the environment and build the site:

\```bash
#### 1. Install Python dependencies
uv sync

#### 2. Install R dependencies
Rscript -e "if (!requireNamespace('renv', quietly = TRUE)) install.packages('renv'); renv::restore(prompt = FALSE)"

#### 3. Activate the virtual environment
source .venv/bin/activate

#### 4. Render the site
quarto render

#### 5. Preview the site locally
quarto preview
\```

Because `_quarto.yml` specifies:

\```yaml
output-dir: docs
\```

the generated website is written to `docs/`.

### Quick build (one click)
 
For a no-terminal option, two scripts in the repo root run all four steps above automatically:
 
- **macOS:** double-click `build-macos.command`
  - First run only: right-click the file → **Open**, to bypass Gatekeeper's unidentified-developer warning.
  - If macOS says the file *"could not be executed because you do not have appropriate access privileges"*, the executable bit was stripped during download (common after downloading via browser/Slack/zip). Fix it once in Terminal:
```bash
    cd /path/to/mds-website
    chmod +x build-macos.command
```  
  Then double-click the file again.

- **Windows:** double-click `build-windows.bat`
  - First run only: if SmartScreen appears, click **More info** → **Run anyway**.
  - ⚠️ Not yet verified on an actual Windows machine — the steps mirror the Mac script, but if you hit issues, please open an issue or fix and PR.
Both scripts require `uv` and `R`/`Rscript` to already be installed and available on PATH. The script installs dependencies, renders the site, and starts the local preview server; close the terminal window (or press `Ctrl+C`) to stop the preview.

### Generated output

`docs/` contains the rendered website, including:

- Generated HTML pages
- Blog post pages
- Copied images and media
- Search data
- Quarto JavaScript and CSS assets
- Bootstrap assets
- Other resources required by the rendered site

The source of truth for the website is the project files outside `docs/`; `docs/` is the rendered output.

## Adding a blog post

Create a directory under `posts/` for the new post:

```text
posts/
└── my-new-post/
    ├── index.qmd
    └── media/
        └── ...
```

Put the post content in `index.qmd` and post-specific images/videos in `media/`.

For example:

```text
posts/
└── my-new-post/
    ├── index.qmd
    └── media/
        ├── photo-1.jpeg
        └── video.mp4
```

Reference media from the post using paths relative to `index.qmd`, for example:

```markdown
![Description](media/photo-1.jpeg)
```

After adding or editing content, render the site with:

```bash
quarto render
```

## Source vs. generated files

A useful mental model for this repository is:

```text
Source
  │
  ├── .qmd pages
  ├── posts/
  ├── images/
  └── CSS
       │
       ▼
   quarto render
       │
       ▼
Generated site
       │
       └── docs/
```

Edit the source files, render the project, and inspect the generated site in `docs/`.

## Notes

- The website output directory is `docs/`.
- Blog content is organized as one directory per post.
- Post-specific media lives with the corresponding post.
- `m3e.css` is the main custom visual layer referenced by the current Quarto configuration.
- The repository currently contains the rendered `docs/` site alongside the Quarto source.

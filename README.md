# favicon-generator

Generates favicons covering all major browsers and devices in 2020. Uses
https://www.emergeinteractive.com/insights/detail/the-essentials-of-favicons/ as
inspiration.

Generates a set of PNG images, a JSON file `manifest.json` with proper `icon`
values, and an HTML file `favicon.html` with proper `<link>` and `<meta>` tags.
Add the contents of `favicon.html` file to the `<head>` tag of your site and the
`icon` property in `manifest.json` to `/manifest.json` of your site.

# Requirements

Install `imagemagick` (e.g., via Homebrew on macOS) and `imagemin` CLI along
with `pngquant` plugin (e.g., with Node.js)

Uses Imagemagick to create different favicon sizes using a root file (which
should be at least 512x512). After that compresses them with `pngquant`

# Usage

`generate-favicon.sh -i ORIGIN_FILENAME [-o OUTPUT_DIRECTORY]`

By default, `OUTPUT_DIRECTORY` is the directory in which `generate-favicon.sh`
is.

For example: `generate-favicon.sh -i My_Favicon.png -o favicons`

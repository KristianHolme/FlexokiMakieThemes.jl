# FlexokiMakieThemes.jl

[Flexoki](https://stephango.com/flexoki) color themes for [Makie.jl](https://docs.makie.org/stable/).

Color-only by design: these themes set colors (background, text, lines, palette,
colormap, 3D lighting) and leave all chrome — spines, ticks, grids, frames,
fonts — to whichever Makie style theme you choose.

## Installation

```julia
using Pkg
Pkg.add("FlexokiMakieThemes")
```

## Usage

```julia
using Makie
using FlexokiMakieThemes

# Flexoki colors first — in Makie's merge the first theme wins — then the
# style theme supplies the remaining chrome
set_theme!(merge(theme_flexoki_light(), theme_light()))
set_theme!(merge(theme_flexoki_dark(),  theme_dark()))

fig, ax, _ = lines(1:10, cumsum(randn(10)))
scatter!(ax, 1:10, cumsum(randn(10)))
fig
```

## Screenshots

To add a figure, open this file in the GitHub web editor and drag an image
into the text area — GitHub uploads it and inserts the markdown — then replace
one of the placeholders below.

`theme_flexoki_light()` + `theme_light()`:

<!-- ![Flexoki light](paste-image-url-here) -->

`theme_flexoki_dark()` + `theme_dark()`:

<!-- ![Flexoki dark](paste-image-url-here) -->

## API

- `theme_flexoki_light()` / `theme_flexoki_dark()` — color-only `Theme`s.

## License

This package is MIT licensed (see `LICENSE`). The Flexoki palette is
copyright (c) 2023 Steph Ango and used under the MIT license — see
`LICENSE-Flexoki` (https://github.com/kepano/flexoki).

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

# Flexoki colors on top of your preferred style theme
set_theme!(merge(theme_light(), theme_flexoki_light()))
set_theme!(merge(theme_dark(),  theme_flexoki_dark()))

fig, ax, _ = lines(1:10, cumsum(randn(10)))
scatter!(ax, 1:10, cumsum(randn(10)))
fig
```

## API

- `theme_flexoki_light()` / `theme_flexoki_dark()` — color-only `Theme`s.

The lower-level `FlexokiMakieThemes.theme_flexoki(tokens)` and
`FlexokiMakieThemes.flexoki_tokens(mode)` are available but not exported.

## License

MIT. Flexoki palette by Steph Ango, also MIT.

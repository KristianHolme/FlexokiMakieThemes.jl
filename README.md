# FlexokiMakieThemes.jl

[![CI](https://github.com/KristianHolme/FlexokiMakieThemes.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/KristianHolme/FlexokiMakieThemes.jl/actions/workflows/CI.yml)
[![codecov](https://codecov.io/gh/KristianHolme/FlexokiMakieThemes.jl/graph/badge.svg)](https://codecov.io/gh/KristianHolme/FlexokiMakieThemes.jl)

[Flexoki](https://stephango.com/flexoki) color themes for [Makie.jl](https://docs.makie.org/stable/).

Color-only by design: these themes set colors (background, text, lines, palette,
colormap, 3D lighting) and leave all chrome — spines, ticks, grids, frames,
fonts — to whichever Makie style theme you choose.

## Intended use

These themes use the Flexoki UI palette. They are **not** scientifically
designed perceptual color schemes — they are not optimized for perceptual
uniformity, equal lightness steps, colorblind-safe sequential mapping, or
similar criteria in the [ColorSchemes.jl](https://github.com/JuliaPlots/ColorSchemes.jl) / scientific visualization sense.

They are intended so figures can match a Flexoki-themed desktop, editor, or
terminal. They are **not recommended for publication figures** where a
purpose-built scientific colormap or palette is more appropriate.

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

`theme_flexoki_light()`:

<img width="2400" height="1600" alt="flexoki_light" src="https://github.com/user-attachments/assets/9000a9b7-d141-4a3d-ae5d-a60f3b87613f" />


`theme_flexoki_dark()`:

<img width="2400" height="1600" alt="flexoki_dark" src="https://github.com/user-attachments/assets/0d7e5b87-7e9e-4348-a578-bffa11ee2e85" />


## API

- `theme_flexoki_light()` / `theme_flexoki_dark()` — color-only `Theme`s.

## License

This package is MIT licensed (see `LICENSE`). The Flexoki palette is
copyright (c) 2023 Steph Ango and used under the MIT license — see
`LICENSE-Flexoki` (https://github.com/kepano/flexoki).

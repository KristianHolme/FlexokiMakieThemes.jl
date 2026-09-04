using Test
using Makie
using FlexokiMakieThemes

@testset "FlexokiMakieThemes.jl" begin
    @testset "tokens" begin
        for mode in (:light, :dark)
            tokens = FlexokiMakieThemes.flexoki_tokens(mode)
            @test tokens isa NamedTuple
            @test all(k in keys(tokens) for k in
                (:bg, :bg2, :ui, :ui2, :ui3, :tx, :tx2, :tx3, :accents))
            @test length(tokens.accents) == 8
            @test tokens.colormap isa Makie.PlotUtils.ColorGradient
        end
        @test_throws ArgumentError FlexokiMakieThemes.flexoki_tokens(:sepia)
    end

    @testset "themes" begin
        light = theme_flexoki_light()
        dark = theme_flexoki_dark()
        @test light isa Makie.Theme
        @test dark isa Makie.Theme

        # color-only: attribute blocks hold colors, not structural chrome
        chrome = (
            :xgridvisible, :ygridvisible, :zgridvisible, :leftspinevisible,
            :rightspinevisible, :bottomspinevisible, :topspinevisible,
            :xspinesvisible, :yspinesvisible, :zspinesvisible, :xticksvisible,
            :yticksvisible, :zticksvisible, :ticksvisible, :spinewidth,
            :framevisible, :framewidth, :padding, :xticksize, :yticksize,
            :xminorticksize, :yminorticksize, :xtickalign, :ytickalign,
            :xminortickalign, :yminortickalign, :xminorticks, :yminorticks,
            :xlabelpadding, :ylabelpadding, :ticklabelsize, :ticklabelpad,
        )
        for t in (light, dark)
            for k in (:Axis, :Legend, :Colorbar, :Axis3)
                @test isempty(intersect(keys(t[k]), chrome))
            end
        end

        # composes with style themes: in Makie's merge the first theme wins,
        # so Flexoki supplies colors while the style theme fills the gaps
        merged = merge(dark, theme_dark())
        @test merged isa Makie.Theme
        @test merged.palette.color[] == dark.palette.color[]
        @test merged.backgroundcolor[] == dark.backgroundcolor[]
        @test merged.Axis.leftspinevisible[] == false
    end
end

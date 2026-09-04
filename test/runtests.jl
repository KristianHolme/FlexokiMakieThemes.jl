using Test
using Makie
using FlexokiMakieThemes

@testset "FlexokiMakieThemes.jl" begin
    @testset "tokens" begin
        for mode in (:light, :dark)
            tokens = flexoki_tokens(mode)
            @test tokens isa NamedTuple
            @test all(k in keys(tokens) for k in
                (:bg, :bg2, :ui, :ui2, :ui3, :tx, :tx2, :tx3, :accents))
            @test length(tokens.accents) == 8
            @test tokens.colormap isa Makie.PlotUtils.ColorGradient
        end
        @test_throws ArgumentError flexoki_tokens(:sepia)
    end

    @testset "themes" begin
        light = theme_flexoki_light()
        dark = theme_flexoki_dark()
        @test light isa Makie.Theme
        @test dark isa Makie.Theme

        # color-only: no chrome/furniture keys
        for t in (light, dark)
            @test isempty(intersect(keys(t), (:Axis, :Legend, :Axis3, :Colorbar)))
        end

        # composes with style themes
        merged = merge(theme_minimal(), light)
        @test merged isa Makie.Theme
    end
end

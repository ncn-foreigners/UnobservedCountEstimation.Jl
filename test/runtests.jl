using UnobservedCountEstimation
using Test
# TODO:: CSV is only used for testing, maybe specify that in Project.toml
using CSV, DataFrames

@testset "zhang_model.jl" begin
    df = CSV.read(pwd() * "/test_csv_zhang.csv", DataFrame)

    a = zhang_model(df[:, :m], df[:, :N], df[:, :n]; start = "glm")
    b = zhang_model(df[:, :m], df[:, :N], df[:, :n]; start =  "lm")

    @test a[1][4] ≈ sum(df[:, :ξ]) rtol=.075
    @test a[1][4] ≈ sum(df[:, :M]) rtol=.075

    @test b[1][4] ≈ sum(df[:, :ξ]) rtol=.075
    @test b[1][4] ≈ sum(df[:, :M]) rtol=.075
end

# for now
#= @testset "binomial_model.jl" begin
    df = CSV.read(pwd() * "/test_csv_binomial.csv", DataFrame)

    a = binomial_model(df[:, :m], df[:, :N], df[:, :n]; start = "glm")
    b = binomial_model(df[:, :m], df[:, :N], df[:, :n]; start =  "lm")

    @test a[1][4] ≈ sum(df[:, :ξ]) rtol=.075
    @test a[1][4] ≈ sum(df[:, :M]) rtol=.075

    @test b[1][4] ≈ sum(df[:, :ξ]) rtol=.075
    @test b[1][4] ≈ sum(df[:, :M]) rtol=.075
end =#


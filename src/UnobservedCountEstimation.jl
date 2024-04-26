module UnobservedCountEstimation

# Write your package code here.

# Imports
using Optim 
using Statistics
using GLM
using Distributions
using DataFrames
using SpecialFunctions
using LinearAlgebra
using Integrals
using Copulas

include("zhang_likelihood.jl")
include("original_model.jl")

include("binomial_model_sampling.jl")
include("binomial_model.jl")

include("interface.jl")

export placeholder
export zhang_model
export binomial_model

end

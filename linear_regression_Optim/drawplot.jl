#!/usr/local/bin/julia
using Plots
using JLD
include("standarize_log.jl")
## load data
theta_file = "data/theta_lambda_1.jld";
test_file = "data/train_good.jld";
d = load(theta_file);
theta = d["theta"];
d = load(test_file);
X = d["X_train_good"];
y = d["y_train_good"];
d = nothing;

X = [ones(size(X,1),1) X];

## draw data
Min = 0.5;
Max = 1.28352669944116;
y = standarize_log(y,Max,Min)*2;
y_pred = X*theta;
y_pred[y_pred.<0].=0
scatter(y,y_pred,markersize = 1,title="prediction - real")
savefig("train.pdf")



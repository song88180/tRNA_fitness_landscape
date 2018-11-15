#!~/bin/julia
include("standarize_log.jl")
include("myf.jl")
include("linearRegCostFunction.jl")
using Optim
using Statistics
using Printf
using JLD
###################
#    load data    #
###################
println("loading train_good\n")
d = load("data/train_good.jld");
X_train_good = d["X_train_good"];
y_train_good = d["y_train_good"];
size(X_train_good)

println("loading train_bad\n")
d = load("data/train_bad.jld");
X_train_bad = d["X_train_bad"];
y_train_bad = d["y_train_bad"];
size(X_train_good)

println("loading test\n")
d = load("data/test.jld");
X_test = d["X_test"];
y_test = d["y_test"];
size(X_test)
d = nothing;

####################
#   standarize y   #
####################

println("standarize y\n")
Max = maximum([y_train_good;y_test;0.5]);
Min = 0.5;

X_train = [X_train_good;X_train_bad];
X_train = [trues(size(X_train,1),1) X_train];
y_train = [y_train_good;y_train_bad];

X_train_good = nothing;
y_train_good = nothing;
X_train_bad = nothing;
y_train_bad = nothing;

y_train = standarize_log(y_train,Max,Min)*2;
m = size(X_train, 1);

X_test = [trues(size(X_test,1),1) X_test];
y_test = standarize_log(y_test,Max,Min)*2;

##############################################
#  prepae other parameters (lambda, theta)   #
##############################################
lambda = 1;
d = load("data/theta_lambda_10.jld");
theta = d["theta"];
#theta = 0.01*randn(size(X_train, 2), 1);
d = nothing;

X_train = Float64.(X_train);
X_test = Float64.(X_test);

#################
#    training   #
#################
@time theta,trace = myf(cost_f.f,cost_f.g!,X_train,y_train,theta,lambda,0);

##################
#   correlation  #
##################
p = X_train*theta;
p[p.<0] .= 0;
c = cor(p,y_train);
J = cost_f.f(theta,y_train,0,p);
@printf("training set correlation: %.6f", c)
@printf("training set loss: %.6f\n", J)

p = X_test*theta;
p[p.<0] .= 0;
c = cor(p,y_test);
J = cost_f.f(theta,y_test,0,p);
@printf("test set correlation: %.6f", c)
@printf("test set loss: %.6f\n", J)

#################
#   save theta  #
#################
#save("data/theta_new.jld","theta",theta)
#save("data/trace.jld","trace",trace)

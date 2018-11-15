#!~/bin/julia
using JLD
using Printf
using Statistics
include("standarize_log.jl")
include("myf.jl")
include("linearRegCostFunction.jl")
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
d = load("data/theta.jld");
theta = d["theta"];
d = nothing;

X_train = Float64.(X_train);
X_test = Float64.(X_test);

#################
#    training   #
#################
@time theta = myf(linearRegCostFunction,X_train,y_train,theta,lambda,0.001,50000,X_test)

##################
#   correlation  #
##################
p = X_train*theta;
p[p.<0] .= 0;
c = cor(p,y_train);
@printf("training set correlation: %.6f\n", c)
p = X_test*theta;
p[p.<0] .= 0;
c = cor(p,y_test);
@printf("test set correlation: %.6f\n", c)

#################
#   save theta  #
#################
save("data/theta_new.jld","theta",theta)

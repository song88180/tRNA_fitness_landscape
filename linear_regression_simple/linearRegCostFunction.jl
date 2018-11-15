#!~/bin/julia
function linearRegCostFunction(X, y, theta, lambda)
    m = length(y); # number of training examples
    J = 0; # initiate Loss 
    grad = zeros(size(theta)); # initiate weight gradient
    
    p = X*theta; # calculate prediction
    #p[p.<0].= 0;  # if prediction < 0, prediction = 0
    p[p.<0].= 0;
    J = sum((p-y).^2)/(2*m)+sum(theta[2:end].^2)/(2*m)*lambda; # calculate loss
    grad = X'*(p-y)/m+lambda/m*[0;theta[2:end]]; # calculate weight gradient
    return J,grad
end



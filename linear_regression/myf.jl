#!~/bin/julia
function myf(f,X,y,theta,lambda,lr,length,X_test)
    #lr = 0.001;
    for i = 1:length
        J,grad = f(X,y,theta,lambda);
	@printf("Iteration %4i | Cost: %.6e\n", i, J)
	theta = theta - grad.*lr;
	if i%100 == 0 
	    p = X*theta;
	    p[p.<0] .= 0;
	    c = cor(p,y_train);
	    @printf("training set correlation: %.6f\n", c)
	    p = X_test*theta;
	    p[p.<0] .= 0;
	    c = cor(p,y_test);
	    @printf("test set correlation: %.6f\n", c)
	end
    end
    return theta
end


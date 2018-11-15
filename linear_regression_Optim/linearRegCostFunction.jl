#!~/bin/julia
module cost_f
    function g!(theta,G,X,y,lambda,p)
        m = length(y);
	p[:] = X*theta;
	#p[p.<0].= 0;
	p[(p.<0).&(y.==0)].= 0;
        G[:] = X'*(p-y)/m+lambda/m*[0;theta[2:end]]; # add [:] to broadcast
    end
    
    function f(theta,y,lambda,p)
        m = length(y);
	#p[:] = X*theta;
	#p[p.<0].= 0;
	#p[(p.<0).&(y.==0)].= 0;
        return sum((p-y).^2)/(2*m)+sum(theta[2:end].^2)/(2*m)*lambda;
    end
end


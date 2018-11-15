#!~/bin/julia
function myf(f,g!,X,y,theta_ini,lambda,iter_gen)
    #lr = 0.001;
    buffer_p = Array{Float64,1}(undef,length(y)); # buffer storge for reusable calculation in f and g!: p = theta*X; p[(p.<0).&(y.==0)].=0
    res = optimize(theta -> f(theta,y,lambda,buffer_p),
		   (G,theta) -> g!(theta,G,X,y,lambda,buffer_p),
		   theta_ini,
		   LBFGS(),
		   Optim.Options(allow_f_increases = true,
				 iterations = iter_gen,
				 store_trace = true,
				 show_trace = true,
				 show_every = 1))
    buffer_p = nothing;
    println(res)
    #println(Optim.minimum(res))
    #return Optim.minimizer(res)
    return res.minimizer[:],res.trace
end


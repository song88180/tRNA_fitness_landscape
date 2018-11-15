#!~/bin/julia
function standarize_log(y,Max,Min)
    y_s = log.(y).-log(Min);
    y_s = y_s./(log(Max)-log(Min));
end

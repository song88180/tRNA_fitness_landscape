function correlation(X_train,X_test,theta)
    p = X_train*theta;
    p[p.<0] .= 0;
    c = cor(p,y_train);
    @printf("training set correlation: %.6f\n", c)
    p = X_test*theta;
    p[p.<0] .= 0;
    c = cor(p,y_test);
    @printf("test set correlation: %.6f\n", c)
end

function x=initialize_variables(pop, M, V, min_range, max_range);
K=M+V;
for i=1:pop
    for j=1:V
       x(i,j)=min_range(j)+rand(1)*(max_range(j)-min_range(j));
    end
    x(i,V+1:K)=evaluate_objective3(x(i,:), M, V);
end

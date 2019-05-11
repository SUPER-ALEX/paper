function f=genetic_operator(chromosome,weight,nei_num,T,M,V,min_range,max_range)

N=size(weight,1);
mu=20;
for i=1:N
    child= [];
    r=randperm(T);
    parent_1 = chromosome(nei_num(i,r(1)),:);
    parent_2 = chromosome(nei_num(i,r(2)),:);
    for j=1:V
        u(j) = rand(1);
        if u(j) <= 0.5
            bq(j) = (2*u(j))^(1/(mu+1));
        else
            bq(j) = (1/(2*(1 - u(j))))^(1/(mu+1));
        end
        if rand()<0.5
            child(j)=0.5*(((1 - bq(j))*parent_1(j)) + (1 + bq(j))*parent_2(j));
        else
            child(j)=0.5*(((1 + bq(j))*parent_1(j)) + (1 - bq(j))*parent_2(j));
        end
        if child(j)<min_range(j)
            child(j)=min_range(j);
        elseif child(j)>max_range(j)
            child(j)=max_range(j);
        end
    end
    child(V + 1: M + V) = evaluate_objective3(child(:), M, V);
    
    f(i,:)=child;
end
    
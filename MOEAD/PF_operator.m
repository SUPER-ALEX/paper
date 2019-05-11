function f=PF_operator(x, PF_num, M, V, min_range, max_range)

f=[];
n=size(x,1);
for i=1:n
    for j=1:M-1
        f(i,j)=x(i,j);
    end
end
for i=1:M-1
    f(n+1,i)=0;
    f(n+2,i)=1;
end
for i=1:M-1
    f(n+3,i)=min_range(i)+rand(1)*(max_range(i)-min_range(i));
    for j=n+4:PF_num
        if f(j-1,i)<0.5
            Tx=2*f(j-1,i);
        else
            Tx=2*(1-f(j-1,i));
        end
        if f(j-1,i)==0 || f(j-1,i)==0.25 || f(j-1,i)==0.5 || f(j-1,i)==0.75
            f(j,i)=Tx+0.1*rand;
        else
            f(j,i)=Tx;
        end
    end
end
for i=1:PF_num
    for j=M:V
        f(i,j)=0.5;
    end
    f(i,V+1:V+M)=evaluate_objective3(f(i,:), M, V);
end
% for i=1:PF_num
%     for j=1:V
%         if i<=n && j<M
%             f(i,j)=x(i,j);
%         elseif j<M
%             f(i,j)=rand();
%         else
%             f(i,j)=0.5;
%         end
%     end
%     
%     f(i,V+1:V+M)=evaluate_objective2(f(i,:), M, V);
%     
% end
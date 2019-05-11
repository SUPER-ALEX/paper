function f=non_domination_sort_mod(x, M, V)

%% pareto¸³Öµ
f=[];
[n,m]=size(x);
clear m
front=1;
F(front).f = [];
individual=[];
for i=1:n
   individual(i).n = 0;
   individual(i).p = [];
   for j=1:n
       wh_g1=0;
       wh_g2=0;
      dom_less=0;
      dom_equal = 0;
      dom_more = 0;
      for k=1:M
          wh_g1=wh_g1+x(i,V+k).^2;
          wh_g2=wh_g2+x(j,V+k).^2;
         if x(i,V+k)<x(j,V+k)
             dom_less=dom_less+1;
         elseif x(i,V+k)==x(j,V+k)
             dom_equal=dom_equal+1;
         else
             dom_more =dom_more +1;
         end
      end
      if dom_less==0 && dom_equal~=M
          individual(i).n=individual(i).n+1;
      elseif dom_more==0 && dom_equal~=M
          individual(i).p = [individual(i).p j];
      end
   end
   if individual(i).n==0
       x(i,M+V+1)=1;
       F(front).f = [F(front).f i];
   end
end
while ~isempty(F(front).f)
   Q = [];
   for i = 1 : length(F(front).f)
       if ~isempty(individual(F(front).f(i)).p)
        	for j = 1 : length(individual(F(front).f(i)).p)
            	individual(individual(F(front).f(i)).p(j)).n = ...
                	individual(individual(F(front).f(i)).p(j)).n - 1;
        	   	if individual(individual(F(front).f(i)).p(j)).n == 0
               		x(individual(F(front).f(i)).p(j),M + V + 1) = ...
                        front + 1;
                    Q = [Q individual(F(front).f(i)).p(j)];
                end
            end
       end
   end
   front =  front + 1;
   F(front).f = Q;
end
for i=1:n
    if x(i,M+V+1)==1
        f=[f;x(i,1:M+V+1)];
    end
end
% Y=[];
% [f_value,i_num]=sort(x(:,M+V+1));
% for i=1:length(i_num)
%     Y(i,:)=x(i_num(i),:);
% end
% f=Y;


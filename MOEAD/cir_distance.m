function f=cir_distance(x,M,V)

f=[];
Y=[];
K=M+V;
distance=[];
n=size(x,1);
for i=1:M
    objective=[];
    number=[];
    f_max=[];
    f_min=[];
    [objective,number]=sort(x(:,V+i));
    f_max=objective(length(number));
    f_min=objective(1);
    distance(number(1)).t(i)=Inf;
    distance(number(length(number))).t(i)=Inf;
    for j=2:length(number)-1
        if f_max-f_min==0
            distance(number(j)).t(i)=Inf;
        else
        distance(number(j)).t(i)=((objective(j-1)-objective(j+1))/(f_max-f_min)).^2;
        end
    end
end
for i=1:n
    distance(i).t(M+1)=0;
    for j=1:M
       distance(i).t(M+1)= distance(i).t(M+1)+distance(i).t(j);
    end
   distance(i).t(M+2)=sqrt(distance(i).t(M+1));
    x(i,M+V+2)= 1/(distance(i).t(M+2)+1);
    x(i,M+V+3)= x(i,M+V+1)+x(i,M+V+2);
end
[f_value,i_num]=sort(x(:,M+V+3));
for i=1:n
    Y(i,:)=x(i_num(i),1:M+V+2);
end
f=Y;

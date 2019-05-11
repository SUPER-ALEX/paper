function func_val=value_objective(pop,m,n)
[xsize,ysize]=size(pop);
for i=1:xsize
    %%ZDT1
%     f=[];
%     f(1)=pop(i,1);
%     sum=0;
%     for j=2:n
%         sum=sum+pop(i,j);
%     end
%     gx=1+9*sum/(n-1);
%     f(2)=gx*(1-sqrt(f(1)/gx));
%     pop(i,n+1:n+m)=f;
    %%ZDT2
%     f=[];
%     f(1)=pop(i,1);
%     sum=0;
%     for j=2:n
%         sum=sum+pop(i,j);
%     end
%     gx=1+9*sum/(n-1);
%     f(2)=gx*(1-(f(1)/gx)^2);
%     pop(i,n+1:n+m)=f;
    %%ZDT3
%     f=[];
%     f(1)=pop(i,1);
%     sum=0;
%     for j=2:n
%         sum=sum+pop(i,j);
%     end
%     gx=1+9*sum/(n-1);
%     f(2)=gx*(1-sqrt(f(1)/gx)-(f(1)/gx)*(sin(10*3.1415926*f(1))));
%     pop(i,n+1:n+m)=f;
    %%ZDT4
    f=[];
    f(1)=pop(i,1);
    sum=0;
    for j=2:n
        sum=sum+pop(i,j);
    end
    gx=1+10*(n-1)+sum;
    f(2)=gx*(1-sqrt(f(1)/gx));
    pop(i,n+1:n+m)=f;
end
func_val=pop;
end
    
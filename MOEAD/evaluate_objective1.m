function f=evaluate_objective1(x, M, V)

f=[];
xm=V-M+1;
sum=0;
for i=M:V
   sum=sum+ (x(i)-0.5).^2-cos(20.*pi.*(x(i)-0.5));
end
g_x=100*(xm+sum);
f(1)=0.5*(1+g_x);
for i=1:M-1
   f(1)=f(1)*x(i);
end
for j=2:M-1
   f(j)=0.5*(1+g_x)*(1-x(M-j+1));
   for k=1:M-j
      f(j)=f(j)*x(k);
   end
end
f(M)=0.5*(1+g_x)*(1-x(1));
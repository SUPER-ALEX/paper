function f=evaluate_objective4(x, M, V)

f=[];
a=100;
xm=V-M+1;
g_x=0;
for i=M:V
   g_x=g_x+ (x(i)-0.5).^2;
end
f(1)=1+g_x;
for i=1:M-1
   f(1)=f(1)*cos(x(i).^a*pi./2); 
end
for i=2:M-1
   f(i)= (1+g_x)*sin(x(M-i+1).^a*pi./2);
   for j=1:M-i
      f(i)=f(i)*cos(x(j).^a*pi./2);
   end
end
f(M)=(1+g_x)*sin(x(1).^a*pi./2);
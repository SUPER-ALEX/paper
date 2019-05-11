function f=evaluate_objective5(x, M, V)


f=[];
xm=V-M+1;
g_x=0;
for i=M:V
   g_x=g_x+ (x(i)-0.5).^2;
end
% g_x=g_x/M;
C=[];
C(1)=x(1);
for i=2:M-1
    C(i)=pi*(1+2*g_x*x(i))/(4*(1+g_x));

end
f(1)=1+g_x;
for i=1:M-1
   f(1)=f(1)*cos(C(i)*pi./2); 
end
for i=2:M-1
   f(i)= (1+g_x)*sin(C(M-i+1)*pi./2);
   for j=1:M-i
      f(i)=f(i)*cos(C(j)*pi./2);
   end
end
f(M)=(1+g_x)*sin(C(1)*pi./2);
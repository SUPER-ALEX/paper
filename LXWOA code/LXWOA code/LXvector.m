function [y1 y2]=LXvector(x1,x2,low,up,dim) % laplace crorrover  function
a=0;b=0.10;y1=[];y2=[];
u=rand(1,dim);
r=rand(1,dim);
beta=(r<0.5).*(a-b.*log(u))+(r>=0.5).*(a+b.*log(u));
y1=x1+beta.*abs(x1-x2);
y1=(y1<low | y1>up).*(low+(up-low).*rand(1,dim))+(y1>low & y1<up).*y1;
y2=x2+beta.*abs(x1-x2);
y2=(y2<low|y2>up).*(low+(up-low).*rand(1,dim))+(y2>low & y2<up).*y2;


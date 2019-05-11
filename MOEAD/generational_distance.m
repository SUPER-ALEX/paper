function f=generational_distance(A, B, M, V)

f=0;
n=size(A,1);
m=size(B,1);
dis=0;
min_dis=0;
d=0;
for i=1:n
    dis=[];
    for j=1:m
        d_dis=0;
        for k=V+1:V+M
            d_dis=d_dis+(A(i,k)-B(j,k)).^2;
        end
        dis(j)=sqrt(d_dis);
    end
    min_dis=min(dis(:));
    d=d+min_dis.^2;
end
f=sqrt(d)/n;

            
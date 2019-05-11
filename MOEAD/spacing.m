function f=spacing(C, M, V)

f=0;
n=size(C,1);
min_dis=[];
dis=[];
for i=1:n
    dis(i).t=[];
    for j=1:n
        if i~=j
            d_dis=0;
            for k=V:V+M
                d_dis=d_dis+(C(i,k)-C(j,k)).^2;
            end
            d_dis=sqrt(d_dis);
            dis(i).t=[dis(i).t;d_dis];
        end
    end
    min_dis(i)=min(dis(i).t(:));
end
f=sqrt(var(min_dis(:))./(n-1));
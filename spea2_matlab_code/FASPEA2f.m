function [StrD,time]=FASPEA2f(pa)
% Authors: Maoguo Gong and Licheng Jiao
% April 7, 2006
% Copyright (C) 2005-2006 by Maoguo Gong (e-mail: gongmg@126.com)
%--------------------------------------------------------------------------
tic;
[twoN,C]=size(pa);
F=zeros(twoN,twoN);Fpa=zeros(twoN,C+2);Fpa(:,1:C)=pa;S=zeros(twoN,twoN);
for p=1:twoN
    P=pa(p,:);Sp=[];
    for q=1:twoN
        Q=pa(q,:);
        if DONtwo(P,Q)==1
            Sp=[Sp,q];
        elseif DONtwo(Q,P)==1
            Fpa(p,C+1)=Fpa(p,C+1)+1;
        end
        S(p,1:size(Sp,2))=Sp;
    end
end
for i=1:twoN
    zzz=S(i,:);aaa=find(zzz==0);zzz(aaa)=[];  
    Si(i)=size(zzz,2);
end %calculate strength values
%--------------------------------------------------------------------------
R=zeros(twoN,1);
for i=1:twoN
    for j=1:twoN
       if length(find(S(j,:)==i))==1
           R(i)=R(i)+Si(j);
       end
    end        
end %calculate the raw fitness
%--------------------------------------------------------------------------
for i=1:twoN
    for j=i+1:twoN
        E(i,j)=sqrt(sum((pa(i,:)-pa(j,:)).^2));
        E(j,i)=E(i,j);
    end
end
k=floor(sqrt(twoN));
sortE=sort(E,2);
D=1./(sortE(:,k)+2);% calculte density 
%--------------------------------------------------------------------------
StrD=D+R;
time=toc;
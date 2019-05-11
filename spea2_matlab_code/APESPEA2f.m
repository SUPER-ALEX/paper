function [EPOP,Epa,time]=APESPEA2f(POP,pa,Fit,Ne)
% Authors: Maoguo Gong and Licheng Jiao
% April 7, 2006
% Copyright (C) 2005-2006 by Maoguo Gong (e-mail: gongmg@126.com)
%--------------------------------------------------------------------------
tic;
ndsign=find(Fit<1);
if length(ndsign)<=Ne
    [aaa,ta1]=sort(Fit);
    EPOP=POP(ta1(1:Ne),:);
    Epa=pa(ta1(1:Ne),:);
else
    tP=POP(ndsign,:);
    tpa=pa(ndsign,:);
    [Ns,C]=size(tpa);
    for i=1:Ns
        for j=i+1:Ns
            E(i,j)=sqrt(sum((tpa(i,:)-tpa(j,:)).^2));
            E(j,i)=E(i,j);
        end
    end
    while Ns>Ne
        SE=[];SE=sort(E,2);
        i=1;cc=[1:Ns]';dd=[];
        while i<Ns
            EC=[];EC=SE(cc,i+1);
            [aa,bb]=min(EC);dd=find(EC==aa);cc=cc(dd);
            if length(cc)==1
                i=Ns+1;deleti=cc;
            end
            i=i+1;
        end
        if length(cc)~=1
            deleti=cc(1);
        end
        tP(deleti,:)=[];tpa(deleti,:)=[];
        E(deleti,:)=[];E(:,deleti)=[];
        Ns=Ns-1;
    end
    EPOP=tP;Epa=tpa;    
end% environmental selection
time=toc;
function [NPOP,time]=BTSf(POP,fit,N)
% Authors: Maoguo Gong and Licheng Jiao
% April 7, 2006
% Copyright (C) 2005-2006 by Maoguo Gong (e-mail: gongmg@126.com)
%--------------------------------------------------------------------------
tic;
[NM,C]=size(POP);
NPOP=[];Npal=[];
for i=1:N
    b1=i;
    b2=ceil(rand*(NM-0.5)+0.5);
    if fit(b1)<=fit(b2)
        NPOP(i,:)=POP(b1,:);
    else
        NPOP(i,:)=POP(b2,:);
    end
end
time=toc;
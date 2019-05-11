function [NPOP,time]=SBXcross(POP,bu,bd,pc)
% Authors: Maoguo Gong and Licheng Jiao
% April 7, 2006
% Copyright (C) 2005-2006 by Maoguo Gong (e-mail: gongmg@126.com)
%--------------------------------------------------------------------------
tic;
eta_c=15;
[N,C]=size(POP);
NPOP=POP;
y=1;
for i=1:N/2
    r1=rand;
    if r1<=pc
        for j=1:C
            par1=POP(y,j);par2=POP(y+1,j);
            yd=bd(j);yu=bu(j);
            r2=rand;
            if r2<=0.5
                if abs(par1-par2)>10^(-14)
                    y1=min(par1,par2);y2=max(par1,par2);
                    if (y1-yd)>(yu-y2)
                        beta=1+2*(yu-y2)/(y2-y1);
                    else
                        beta=1+2*(y1-yd)/(y2-y1);
                    end
                    expp=eta_c+1;beta=1/beta;alpha=2.0-beta^(expp);
                    r3=rand;
                    if r3<=1/alpha
                        alpha=alpha*r3;expp=1/(eta_c+1.0);
                        betaq=alpha^(expp);
                    else
                        alpha=1/(2.0-alpha*r3);expp=1/(eta_c+1);
                        betaq=alpha^(expp);
                    end
                    chld1=0.5*((y1+y2)-betaq*(y2-y1));
                    chld2=0.5*((y1+y2)+betaq*(y2-y1));   
                    aa=max(chld1,yd);NPOP(y,j)=min(aa,yu);
                    bb=max(chld2,yd);NPOP(y+1,j)=min(bb,yu);
                end  
            end
        end
    end
    y=y+2;
end
time=toc;
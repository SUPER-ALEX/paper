function frontshow(Epa)
% Authors: Maoguo Gong and Licheng Jiao
% April 7, 2006
% Copyright (C) 2005-2006 by Maoguo Gong (e-mail: gongmg@126.com)
%--------------------------------------------------------------------------
if size(Epa,2)==2
    %%plot pareto fronts in 2-D
    f1=Epa(:,1);f2=Epa(:,2);
    plot(f1,f2,'r*'); grid on;
    xlabel('Function 1');
    ylabel('Function 2');
    hold on   
elseif size(Epa,2)>=3
    %%plot pareto fronts in 3-D
    f1=Epa(:,1);f2=Epa(:,2);f3=Epa(:,3);
    plot3(f1,f2,f3,'kd'); grid on;
    xlabel('Function 1');
    ylabel('Function 2');
    zlabel('Function 3');
    hold on   
end

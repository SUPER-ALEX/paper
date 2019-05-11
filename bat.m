% Bat-inspired algorithm for continuous optimization %
% ------------------------------------------------------%
function [best,fmin,N_iter]=bat(para)
% 默认参数
if nargin<1  %输入参数个数
    para=[10 0.25 0.5];
end
seg(1)=0;
n=para(1); % 群体大小, 通常为【10，25】
A=para(2); % 音量 (不变或者减小)
r=para(3); % 脉冲率 (不变或增加)
% 频率范围
Qmin=0; % 最低频率
Qmax=2; % 最高频率
% 迭代参数
tol=10^(-5); % 停止精度
N_iter=0; % 评价函数的总数
% 搜索变量的维数
d=3;
% 初始矩阵
Q=zeros(n,1); % 频率
v=zeros(n,d); % 速度
% 初始化群体/解
for i=1:n
    Sol(i,:)=randn(1,d);
    Fitness(i)=Fun(Sol(i,:));
end
% 寻找当前最优解
[fmin,I]=min(Fitness);
best=Sol(I,:);
% 开始迭代
while (fmin>tol)
    %遍历所有蝙蝠或者解决方案
    for i=1:n,
        Q(i)=Qmin+(Qmin-Qmax)*rand;%rand均匀分布的随机数
        v(i,:)=v(i,:)+(Sol(i,:)-best)*Q(i);
        S(i,:)=Sol(i,:)+v(i,:);
        % 脉冲率
        if rand>r
            S(i,:)=best+0.01*randn(1,d);%randn产生正态分布的随机数
        end
        % 评估新的解
        Fnew=Fun(S(i,:));
        % 如果该解提高或者影响不大
        if (Fnew<=Fitness(i)) & (rand<A) ,
            Sol(i,:)=S(i,:);
            Fitness(i)=Fnew;
        end
        % 更新当前最优解
        if Fnew<=fmin,
            best=S(i,:);
            fmin=Fnew;
        end
    end
    N_iter=N_iter+n;
    seg(N_iter)=fmin;
end
% 输出
disp(['Number of evaluations: ',num2str(N_iter)]);
disp(['Best =',num2str(best),' fmin=',num2str(fmin)]);
%  输出最好值和图形显示
best                 %  输出最好个体的位置（最优x1、x2）
fmin                 %  输出最好个体对应的最好适应值（最优f1值）
N_iter               %  所用迭代次数
           %  图形显示
plot(1:N_iter,seg(1:N_iter),'-.r') ; 
xlabel('迭代次数');                        %  坐标标注
ylabel('全局历史最佳适应值');
title('全局历史最佳适应值趋势图：');
legend('基本BA');


%  End
% *******************************************************************

%目标函数
function z=Fun(u)
z=(1-u(1))^2+100*(u(2)-u(1)^2)^2+(1-u(3))^2;


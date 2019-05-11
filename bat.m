% Bat-inspired algorithm for continuous optimization %
% ------------------------------------------------------%
function [best,fmin,N_iter]=bat(para)
% Ĭ�ϲ���
if nargin<1  %�����������
    para=[10 0.25 0.5];
end
seg(1)=0;
n=para(1); % Ⱥ���С, ͨ��Ϊ��10��25��
A=para(2); % ���� (������߼�С)
r=para(3); % ������ (���������)
% Ƶ�ʷ�Χ
Qmin=0; % ���Ƶ��
Qmax=2; % ���Ƶ��
% ��������
tol=10^(-5); % ֹͣ����
N_iter=0; % ���ۺ���������
% ����������ά��
d=3;
% ��ʼ����
Q=zeros(n,1); % Ƶ��
v=zeros(n,d); % �ٶ�
% ��ʼ��Ⱥ��/��
for i=1:n
    Sol(i,:)=randn(1,d);
    Fitness(i)=Fun(Sol(i,:));
end
% Ѱ�ҵ�ǰ���Ž�
[fmin,I]=min(Fitness);
best=Sol(I,:);
% ��ʼ����
while (fmin>tol)
    %��������������߽������
    for i=1:n,
        Q(i)=Qmin+(Qmin-Qmax)*rand;%rand���ȷֲ��������
        v(i,:)=v(i,:)+(Sol(i,:)-best)*Q(i);
        S(i,:)=Sol(i,:)+v(i,:);
        % ������
        if rand>r
            S(i,:)=best+0.01*randn(1,d);%randn������̬�ֲ��������
        end
        % �����µĽ�
        Fnew=Fun(S(i,:));
        % ����ý���߻���Ӱ�첻��
        if (Fnew<=Fitness(i)) & (rand<A) ,
            Sol(i,:)=S(i,:);
            Fitness(i)=Fnew;
        end
        % ���µ�ǰ���Ž�
        if Fnew<=fmin,
            best=S(i,:);
            fmin=Fnew;
        end
    end
    N_iter=N_iter+n;
    seg(N_iter)=fmin;
end
% ���
disp(['Number of evaluations: ',num2str(N_iter)]);
disp(['Best =',num2str(best),' fmin=',num2str(fmin)]);
%  ������ֵ��ͼ����ʾ
best                 %  �����ø����λ�ã�����x1��x2��
fmin                 %  �����ø����Ӧ�������Ӧֵ������f1ֵ��
N_iter               %  ���õ�������
           %  ͼ����ʾ
plot(1:N_iter,seg(1:N_iter),'-.r') ; 
xlabel('��������');                        %  �����ע
ylabel('ȫ����ʷ�����Ӧֵ');
title('ȫ����ʷ�����Ӧֵ����ͼ��');
legend('����BA');


%  End
% *******************************************************************

%Ŀ�꺯��
function z=Fun(u)
z=(1-u(1))^2+100*(u(2)-u(1)^2)^2+(1-u(3))^2;


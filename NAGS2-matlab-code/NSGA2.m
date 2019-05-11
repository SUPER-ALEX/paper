function NSGA2()
clc;
clear;
close;
%��ʼ������
popnum=200;
gen=600;
xmin=0;%����ȡֵ��Χ
xmax=1;
m=2;%Ŀ�꺯������
n=30;%���߱�����Ŀ
hc=20;%����������
hm=20;
%������ʼ��Ⱥ
initpop=rand(popnum,n)*(xmax-xmin)+xmin;
init_value_pop=value_objective(initpop,m,n);
%��ͼ��ʾ����ͼ
plot(init_value_pop(:,n+1),init_value_pop(:,n+m),'B+');
pause(.1)
%��֧������;۽��������
[non_dominant_sort_pop,rankinfo]=non_dominant_sort(init_value_pop,m,n);
ns_dc_pop=crowding_distance(non_dominant_sort_pop,m,n,rankinfo);
%ѡ�񣬽��棬���������һ���Ӵ�
poolsize=round(popnum/2);%ѡ����н������ĸ���
toursize=2;%ѡ���������Ԫ��
select_pop=selection(ns_dc_pop,poolsize,toursize,m,n); % ѡ��poolsize��
hc=20;%���������ز���
hm=20;
offspring=genetic_operate(select_pop,m,n,hc,hm,xmax,xmin);
%ѭ����ʼ
t=1;
while t<=gen
    %�ϲ���Ⱥ��N+N/2��������ѭ��
    combine_pop(1:popnum,1:m+n+2)=ns_dc_pop;
    [xsize,ysize]=size(offspring);
    combine_pop(popnum+1:popnum+xsize,1:m+n+2)=offspring;
    %���½��з�֧������;۽��������
    [gen_non_dominant_pop,rankinfo]=non_dominant_sort(combine_pop,m,n);
    nsdc_pop=crowding_distance(gen_non_dominant_pop,m,n,rankinfo);
    %ѡ����һ���Ĳ�����Ȼ�����ڽ�����죩
    ns_dc_pop=replace_chromosome(nsdc_pop,m,n,popnum); % N+N/2 ��ѡ����õ�N��
    %��ʾ��һ�������
    if m==2
        plot(ns_dc_pop(:,n+1),ns_dc_pop(:,n+2),'r+')
    elseif m==3
        plot3(ns_dc_pop(:,n+1),ns_dc_pop(:,n+2),ns_dc_pop(:,n+3),'kd')
        xlabel('f1')
        ylabel('f2')
        zlabel('f3')
    end
    grid on;
    text(0,0,0,['�� ',int2str(t),' ��']);
    pause(0.1)
    %�����Լ���
    if t>=(gen*0.9)
        %�����׼��
        opt=load('pareto.dat');
        %�õ�������
        funcval=ns_dc_pop(:,n+1:n+m);
        for j=1:m%��ȡ�����Сֵ
            maxfval(j)=max(funcval(:,j));
            minfval(j)=min(funcval(:,j));
        end
        distance=zeros(1,size(funcval,1));
        sumfval=zeros(1,size(opt,1));
        dsum=0;
        for i=1:size(funcval,1)
            for j=1:size(opt,1)
                for k=1:m
                    sumfval(j)=sumfval(j)+((funcval(i,k)-opt(j,k))/(maxfval(k)-minfval(k)))^2;
                end
            end
            distance(i)=sqrt(min(sumfval));
            sumfval(:)=0;
            dsum=dsum+distance(i);
        end
        c=dsum/size(funcval,1);
    end
    %ѡ�񣬽��棬���������һ���Ӵ�
    poolsize=round(popnum/2);%ѡ����н������ĸ���
    toursize=2;%ѡ���������Ԫ��
    select_pop=selection(ns_dc_pop,poolsize,toursize,m,n);
    hc=20;%���������ز���
    hm=20;
    offspring=genetic_operate(select_pop,m,n,hc,hm,xmax,xmin);
    t=t+1;
end
%��ʾ����
title('result using NSGA-II');
xlabel('Loss');
ylabel('Cd');
end
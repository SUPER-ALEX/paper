%************************************************************************** 
%Author: liubingjie
%First Edited:10/4/2015
%Reference:MOEA/D-DE-��constraint
clc
clear all;

tic;
pop=100;%������ĸ���
gen=1000;
V=34;%���߱�����
M=30;%Ŀ����
T=10;%Ȩ������ĸ���
del=0.9;%��Ȩ��������ѡ���Ŵ����������ĸ���
%del_e=0.7;
nr=1; %?a maximum number of replacements in the neighborhood
for i=1:V%���߱�����[0,1]֮��仯
    min_range(i)=0;
    max_range(i)=1;
end
pop = round(pop);%��������popһ���������������Ƚ���
gen = round(gen);
% % 20������
for s=1:20
s    
chromosome = initialize_variables(pop, M, V, min_range, max_range);
external_archive = non_domination_sort_mod(chromosome, M, V);
% external_archive=cir_distance(external_archive,M,V);
z=[];%�ο���
for i=1:M
    z(i)=min(chromosome(:,V+i));
end

%% Ȩ��ϵ��
   weight=[];
   for i=1:pop
       weight(i,:)=rand(1,M);
       w_sum=sum(weight(i,:));
       for j=1:M
           weight(i,j)=weight(i,j)/w_sum;
       end
       
   end
  %% ���������T��Ȩ��
   distance=[];
   nei_num=[];
   for i=1:pop
       for j=1:pop
           dis=0;
           for k=1:M
               dis=dis+(weight(i,k)-weight(j,k))^2;
           end
           distance(i,j)=sqrt(dis);
       end
       temp=[];
       [temp,index]=sort(distance(i,:));%distance��i,:����һ��1*100�����飿index ��temp��˳��������û���ǲ��Ƿ���
       for l=1:T
           nei_num(i,l)=index(l);
       end
   end
   
external_num=[];
for g=1:gen
    g
   offspring_chromosome =[];
   offspring_chromosome=genetic_operator(chromosome,weight,nei_num,T,M,V,min_range,max_range);
   for i=1:M %���²ο���
       if z(i)>min(offspring_chromosome(:,V+i))
           z(i)=min(offspring_chromosome(:,V+i));
       end
   end
   external=[];
   for i=1:pop
       fit1=[];
       fit2=[];
       for j=1:M
           fit1(j)=weight(i,j)*abs(chromosome(i,V+j)-z(j));
           fit2(j)=weight(i,j)*abs(offspring_chromosome(i,V+j)-z(j));
       end
       chromosome(i,M+V+1)=max(fit1(:));
       offspring_chromosome(i,M+V+1)=max(fit2(:));
       if offspring_chromosome(i,M+V+1)<chromosome(i,M+V+1)%�����Ӵ�
           chromosome(i,:)=offspring_chromosome(i,:);
           external=[external;offspring_chromosome(i,:)];
       end
   end

       
    
end
PF=[];
PF_num=5000;
PF=PF_operator(chromosome, PF_num, M, V, min_range, max_range);
%% ������
GD=generational_distance(chromosome, PF, M, V)
%% �ֲ���
SP=spacing(chromosome, M, V)
% ���Ƿ�Χ
MS=wide_span(chromosome, PF, M, V)
    
fi_max=[];
fi_min=[];
true_max=[];
true_min=[];
fsum1=0;
fsum2=0;
fsum3=0;
for i=1:M
    fi_max(i)=max(chromosome(:,V+i));
    fi_min(i)=min(chromosome(:,V+i));
    true_max(i)=max(PF(:,V+i));
    true_min(i)=min(PF(:,V+i));
    fsum1=fsum1+((min(fi_max(i),true_max(i))-min(fi_min(i),true_min(i)))/(true_max(i)-true_min(i))).^2;
    fsum2=fsum2+((fi_max(i)-fi_min(i))/(true_max(i)-true_min(i))).^2;
    fsum3=fsum3+((min(fi_max(i),true_max(i))-max(fi_min(i),true_min(i)))/(true_max(i)-true_min(i))).^2;
end
MS1=sqrt(fsum1/M)
MS2=sqrt(fsum2/M)
MS3=sqrt(fsum3/M)          
       
   
ex(s,1)=GD;    
ex(s,2)=SP;
ex(s,3)=MS1;
ex(s,4)=MS2;
ex(s,5)=MS3;
end
gd_m=mean(ex(:,1))
sp_m=mean(ex(:,2))
ms1_m=mean(ex(:,3))
ms2_m=mean(ex(:,4))
ms3_m=mean(ex(:,5))       




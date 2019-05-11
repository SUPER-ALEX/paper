function SPEA2_Demo()
% SPEA2_Demo.m
% SPEA2 performs experiment presented in our paper:
% Maoguo Gong, Licheng Jiao.
% Multiobjective Immune Algorithm with Pareto-optimal Neighbor-based Selection.
% Technical Report No. IIIP-06-05, Institute of Intelligent Information Processing,
% Xidian University, Xi'an, China. April 2006.
%
% Authors: Maoguo Gong and Licheng Jiao
% April 7, 2006
% Copyright (C) 2005-2006 by Maoguo Gong (e-mail: gongmg@126.com)
%
% SPEA2 was proposed by Eckart Zitzler, Marco Laumanns and Lothar Thiele.
% SPEA2: Improving the Strength Pareto Evolutionary Algorithm,
% in K. Giannakoglou, D. Tsahalis, J. Periaux, P. Papailou and T. Fogarty (eds.)
% EUROGEN 2001, Evolutionary Methods for Design, Optimization and Control
% with Applications to Industrial Problems, Athens, Greece, 2002: 95-100.
% SPEA2 is Copyrighted by the Authors.
%--------------------------------------------------------------------------
clear all;
%--------------------------------------------------------------------------
disp(sprintf('SPEA2 min'));
disp(sprintf('Authour: Maoguo Gong and Licheng Jiao'));
EMOinstruction;%% display the instruction for running the programming.
%--------------------------------------------------------------------------
TestNO=input('press the enter key after inputting the serial number of test problem:');
Trial=input('input the number of independent runs:');
N=100;%population size
Ne=100;%archive size
gmax=5;%the maximum number of iterations
[bu,bd,testfunction]=getbud(TestNO);%bu denotes the upper boundary of variable;bd denotes the nether boundary of variable
c=size(bu,2);%decision vector dimension
pc=1;%Cross probability  交叉进化的概率
pm=1/c;%mutation probability 突变进化的概率
if bu==bd return;end
%--------------------------------------------------------------------------
Datime=date;
Datime(size(Datime,2)-4:size(Datime,2))=[];%%test date
TestTime=clock;%%test time
TestTime=[num2str(TestTime(4)),'-',num2str(TestTime(5))];
Method='SPEAII';
paretof=[];sizepa=[];
%--------------------------------------------------------------------------

runtime=[];
for trial=1:Trial
    timerbegin=clock;
    %--------------------------------------------------------------------------
    NPOP=rand(N,c).*(ones(N,1)*bu-ones(N,1)*bd)+ones(N,1)*bd;
    EPOP=[];Epa=[];%Initialization
    %--------------------------------------------------------------------------
    it=0;
    FASPEA2fti=0;APESPEA2ti=0;BTSti=0;SBXti=0;PNmti=0;
    while it<gmax
        %--------------------------------------------------------------------------
        twoPOP=[NPOP;EPOP];
        Npa=OVcom(NPOP,TestNO);%compute objective values  种群大小*目标个数
        twopa=[Npa;Epa];
        [Fit,FASPEA2t]=FASPEA2f(twopa);%fitness assignment
        %--------------------------------------------------------------------------
        [EPOP,Epa,APESPEA2t]=APESPEA2f(twoPOP,twopa,Fit,Ne);%enviromental selection
        %--------------------------------------------------------------------------
        [EFit,FASPEA2t2]=FASPEA2f(Epa);
        [NPOP,BTSt]=BTSf(EPOP,EFit,N);%selection
        [NPOP,SBXt]=SBXcross(NPOP,bu,bd,pc);%crossover
        [NPOP,PNmt]=PNmutation(NPOP,bu,bd,pm);%mutation
        %--------------------------------------------------------------------------
        it=it+1;
        disp(sprintf('time: %d   generation: %d ',trial,it));
    end  %the end of iterations
    %--------------------------------------------------------------------------
    twoPOP=[NPOP;EPOP];
    Npa=OVcom(NPOP,TestNO);%compute objective values
    twopa=[Npa;Epa];
    [Fit,FASPEA2t]=FASPEA2f(twopa);%fitness assignment
    %--------------------------------------------------------------------------
    [EPOP,Epa,APESPEA2t]=APESPEA2f(twoPOP,twopa,Fit,Ne);%enviromental selection
    [NS(trial),NF]=size(Epa);Trials=trial;
    paretof=[paretof;Epa];
    runtime(trial)=etime(clock,timerbegin);
end  %the end of runs
%--------------------------------------------------------------------------
% end %the end of TestNO
Frontshow(Epa); % plot the Pareto fronts solved by the last run
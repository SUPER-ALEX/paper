%_________________________________________________________________________%
%  Whale Optimization Algorithm (WOA) source codes demo 1.0               %
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% SearchAgents_no = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run WOA: [Best_score,Best_pos,WOA_cg_curve]=WOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj)
%__________________________________________

clear all 
clc
header={'Best score','time'};W={'WOA'};P={'LXWOA'};
a={'F1','F2','F3','F4','F5','F6','F7','F8','F9','F10','F11','F12','F13','F14','F15','F16','F17','F18','F19','F20','F21','F22','F23'};
SearchAgents_no=30; % Number of search agents
Max_iteration=500; % Maximum numbef of iterations

for F_index=1:23
    WOAresult=[]; WOAresult=[]; WOApos=[]; WOAplotdata=[];LXWOAresult=[]; LXWOAresult=[]; LXWOApos=[]; LXWOAplotdata=[]; 
    Function_name=F_index; % Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)

% Load details of the selected benchmark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);
for run=1:30   % run
 
 Positions=initialization(SearchAgents_no,dim,ub,lb);
 tic
 [Best_score,Best_pos,WOA_cg_curve]=WOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj,Positions);
 t2=toc;
 WOAresult(run,1)=Best_score;
 WOAresult(run,2)=t2;
 WOApos(run,:)=Best_pos;
 WOAplotdata(:,run)=WOA_cg_curve;
 run
 tic
 [Best_score,Best_pos,WOA_cg_curve]=LXWOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj,Positions);
 t1=toc;
 LXWOAresult(run,1)=Best_score;
 LXWOAresult(run,2)=t1;
 LXWOApos(run,:)=Best_pos;
 LXWOAplotdata(:,run)=WOA_cg_curve; 
end
 if F_index==1
    xlswrite('result\Fdata',W,'F1','C1')
    xlswrite('result\Fdata',header,'F1','B2')
    xlswrite('result\Fdata',WOAresult,'F1','B3')
    xlswrite('result\F1Pos',WOApos,'WOA','G3')
    xlswrite('result\F1plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F1','H1')
    xlswrite('result\Fdata',header,'F1','G2')
    xlswrite('result\Fdata',LXWOAresult,'F1','G3')
    xlswrite('result\F1Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F1plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
if F_index==2
    xlswrite('result\Fdata',W,'F2','C1')
    xlswrite('result\Fdata',header,'F2','B2')
    xlswrite('result\Fdata',WOAresult,'F2','B3')
    xlswrite('result\F2Pos',WOApos,'WOA','G3')
    xlswrite('result\F2plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F2','H1')
    xlswrite('result\Fdata',header,'F2','G2')
    xlswrite('result\Fdata',LXWOAresult,'F2','G3')
    xlswrite('result\F2Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F2plotdata',LXWOAplotdata,'LXWOA','B2')      
end
if F_index==3
    xlswrite('result\Fdata',W,'F3','C1')
    xlswrite('result\Fdata',header,'F3','B2')
    xlswrite('result\Fdata',WOAresult,'F3','B3')
    xlswrite('result\F3Pos',WOApos,'WOA','G3')
    xlswrite('result\F3plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F3','H1')
    xlswrite('result\Fdata',header,'F3','G2')
    xlswrite('result\Fdata',LXWOAresult,'F3','G3')
    xlswrite('result\F3Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F3plotdata',LXWOAplotdata,'LXWOA','B2')      
end
if F_index==4
    xlswrite('result\Fdata',W,'F4','C1')
    xlswrite('result\Fdata',header,'F4','B2')
    xlswrite('result\Fdata',WOAresult,'F4','B3')
    xlswrite('result\F4Pos',WOApos,'WOA','G3')
    xlswrite('result\F4plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F4','H1')
    xlswrite('result\Fdata',header,'F4','G2')
    xlswrite('result\Fdata',LXWOAresult,'F4','G3')
    xlswrite('result\F4Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F4plotdata',LXWOAplotdata,'LXWOA','B2')      
end
if F_index==5
    xlswrite('result\Fdata',W,'F5','C1')
    xlswrite('result\Fdata',header,'F5','B2')
    xlswrite('result\Fdata',WOAresult,'F5','B3')
    xlswrite('result\F5Pos',WOApos,'WOA','G3')
    xlswrite('result\F5plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F5','H1')
    xlswrite('result\Fdata',header,'F5','G2')
    xlswrite('result\Fdata',LXWOAresult,'F5','G3')
    xlswrite('result\F5Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F5plotdata',LXWOAplotdata,'LXWOA','B2')      
end
 if F_index==6
    xlswrite('result\Fdata',W,'F6','C1')
    xlswrite('result\Fdata',header,'F6','B2')
    xlswrite('result\Fdata',WOAresult,'F6','B3')
    xlswrite('result\F6Pos',WOApos,'WOA','G3')
    xlswrite('result\F6plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F6','H1')
    xlswrite('result\Fdata',header,'F6','G2')
    xlswrite('result\Fdata',LXWOAresult,'F6','G3')
    xlswrite('result\F6Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F6plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==7
    xlswrite('result\Fdata',W,'F7','C1')
    xlswrite('result\Fdata',header,'F7','B2')
    xlswrite('result\Fdata',WOAresult,'F7','B3')
    xlswrite('result\F7Pos',WOApos,'WOA','G3')
    xlswrite('result\F7plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F7','H1')
    xlswrite('result\Fdata',header,'F7','G2')
    xlswrite('result\Fdata',LXWOAresult,'F7','G3')
    xlswrite('result\F7Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F7plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==8
    xlswrite('result\Fdata',W,'F8','C1')
    xlswrite('result\Fdata',header,'F8','B2')
    xlswrite('result\Fdata',WOAresult,'F8','B3')
    xlswrite('result\F8Pos',WOApos,'WOA','G3')
    xlswrite('result\F8plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F8','H1')
    xlswrite('result\Fdata',header,'F8','G2')
    xlswrite('result\Fdata',LXWOAresult,'F8','G3')
    xlswrite('result\F8Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F8plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==9
    xlswrite('result\Fdata',W,'F9','C1')
    xlswrite('result\Fdata',header,'F9','B2')
    xlswrite('result\Fdata',WOAresult,'F9','B3')
    xlswrite('result\F9Pos',WOApos,'WOA','G3')
    xlswrite('result\F9plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F9','H1')
    xlswrite('result\Fdata',header,'F9','G2')
    xlswrite('result\Fdata',LXWOAresult,'F9','G3')
    xlswrite('result\F9Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F9plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==10
    xlswrite('result\Fdata',W,'F10','C1')
    xlswrite('result\Fdata',header,'F10','B2')
    xlswrite('result\Fdata',WOAresult,'F10','B3')
    xlswrite('result\F10Pos',WOApos,'WOA','G3')
    xlswrite('result\F10plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F10','H1')
    xlswrite('result\Fdata',header,'F10','G2')
    xlswrite('result\Fdata',LXWOAresult,'F10','G3')
    xlswrite('result\F10Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F10plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==11
    xlswrite('result\Fdata',W,'F11','C1')
    xlswrite('result\Fdata',header,'F11','B2')
    xlswrite('result\Fdata',WOAresult,'F11','B3')
    xlswrite('result\F11Pos',WOApos,'WOA','G3')
    xlswrite('result\F11plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F11','H1')
    xlswrite('result\Fdata',header,'F11','G2')
    xlswrite('result\Fdata',LXWOAresult,'F11','G3')
    xlswrite('result\F11Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F11plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==12
    xlswrite('result\Fdata',W,'F12','C1')
    xlswrite('result\Fdata',header,'F12','B2')
    xlswrite('result\Fdata',WOAresult,'F12','B3')
    xlswrite('result\F12Pos',WOApos,'WOA','G3')
    xlswrite('result\F12plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F12','H1')
    xlswrite('result\Fdata',header,'F12','G2')
    xlswrite('result\Fdata',LXWOAresult,'F12','G3')
    xlswrite('result\F12Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F12plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==13
    xlswrite('result\Fdata',W,'F13','C1')
    xlswrite('result\Fdata',header,'F13','B2')
    xlswrite('result\Fdata',WOAresult,'F13','B3')
    xlswrite('result\F13Pos',WOApos,'WOA','G3')
    xlswrite('result\F13plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F13','H1')
    xlswrite('result\Fdata',header,'F13','G2')
    xlswrite('result\Fdata',LXWOAresult,'F13','G3')
    xlswrite('result\F13Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F13plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==14
    xlswrite('result\Fdata',W,'F14','C1')
    xlswrite('result\Fdata',header,'F14','B2')
    xlswrite('result\Fdata',WOAresult,'F14','B3')
    xlswrite('result\F14Pos',WOApos,'WOA','G3')
    xlswrite('result\F14plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F14','H1')
    xlswrite('result\Fdata',header,'F14','G2')
    xlswrite('result\Fdata',LXWOAresult,'F14','G3')
    xlswrite('result\F14Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F14plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==15
    xlswrite('result\Fdata',W,'F15','C1')
    xlswrite('result\Fdata',header,'F15','B2')
    xlswrite('result\Fdata',WOAresult,'F15','B3')
    xlswrite('result\F15Pos',WOApos,'WOA','G3')
    xlswrite('result\F15plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F15','H1')
    xlswrite('result\Fdata',header,'F15','G2')
    xlswrite('result\Fdata',LXWOAresult,'F15','G3')
    xlswrite('result\F15Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F15plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==16
    xlswrite('result\Fdata',W,'F16','C1')
    xlswrite('result\Fdata',header,'F16','B2')
    xlswrite('result\Fdata',WOAresult,'F16','B3')
    xlswrite('result\F16Pos',WOApos,'WOA','G3')
    xlswrite('result\F16plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F16','H1')
    xlswrite('result\Fdata',header,'F16','G2')
    xlswrite('result\Fdata',LXWOAresult,'F16','G3')
    xlswrite('result\F16Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F16plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==17
    xlswrite('result\Fdata',W,'F17','C1')
    xlswrite('result\Fdata',header,'F17','B2')
    xlswrite('result\Fdata',WOAresult,'F17','B3')
    xlswrite('result\F17Pos',WOApos,'WOA','G3')
    xlswrite('result\F17plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F17','H1')
    xlswrite('result\Fdata',header,'F17','G2')
    xlswrite('result\Fdata',LXWOAresult,'F17','G3')
    xlswrite('result\F17Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F17plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==18
    xlswrite('result\Fdata',W,'F18','C1')
    xlswrite('result\Fdata',header,'F18','B2')
    xlswrite('result\Fdata',WOAresult,'F18','B3')
    xlswrite('result\F18Pos',WOApos,'WOA','G3')
    xlswrite('result\F18plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F18','H1')
    xlswrite('result\Fdata',header,'F18','G2')
    xlswrite('result\Fdata',LXWOAresult,'F18','G3')
    xlswrite('result\F18Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F18plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==19
    xlswrite('result\Fdata',W,'F19','C1')
    xlswrite('result\Fdata',header,'F19','B2')
    xlswrite('result\Fdata',WOAresult,'F19','B3')
    xlswrite('result\F19Pos',WOApos,'WOA','G3')
    xlswrite('result\F19plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F19','H1')
    xlswrite('result\Fdata',header,'F19','G2')
    xlswrite('result\Fdata',LXWOAresult,'F19','G3')
    xlswrite('result\F19Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F19plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
 if F_index==20
    xlswrite('result\Fdata',W,'F20','C1')
    xlswrite('result\Fdata',header,'F20','B2')
    xlswrite('result\Fdata',WOAresult,'F20','B3')
    xlswrite('result\F20Pos',WOApos,'WOA','G3')
    xlswrite('result\F20plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F20','H1')
    xlswrite('result\Fdata',header,'F20','G2')
    xlswrite('result\Fdata',LXWOAresult,'F20','G3')
    xlswrite('result\F20Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F20plotdata',LXWOAplotdata,'LXWOA','B2')      
 end
if F_index==21
    xlswrite('result\Fdata',W,'F21','C1')
    xlswrite('result\Fdata',header,'F21','B2')
    xlswrite('result\Fdata',WOAresult,'F21','B3')
    xlswrite('result\F21Pos',WOApos,'WOA','G3')
    xlswrite('result\F21plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F21','H1')
    xlswrite('result\Fdata',header,'F21','G2')
    xlswrite('result\Fdata',LXWOAresult,'F21','G3')
    xlswrite('result\F21Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F21plotdata',LXWOAplotdata,'LXWOA','B2')      
end
if F_index==22
    xlswrite('result\Fdata',W,'F22','C1')
    xlswrite('result\Fdata',header,'F22','B2')
    xlswrite('result\Fdata',WOAresult,'F22','B3')
    xlswrite('result\F22Pos',WOApos,'WOA','G3')
    xlswrite('result\F22plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F22','H1')
    xlswrite('result\Fdata',header,'F22','G2')
    xlswrite('result\Fdata',LXWOAresult,'F22','G3')
    xlswrite('result\F22Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F22plotdata',LXWOAplotdata,'LXWOA','B2')      
end
if F_index==23
    xlswrite('result\Fdata',W,'F23','C1')
    xlswrite('result\Fdata',header,'F23','B2')
    xlswrite('result\Fdata',WOAresult,'F23','B3')
    xlswrite('result\F23Pos',WOApos,'WOA','G3')
    xlswrite('result\F23plotdata',WOAplotdata,'WOA','B2')

    xlswrite('result\Fdata',P,'F23','H1')
    xlswrite('result\Fdata',header,'F23','G2')
    xlswrite('result\Fdata',LXWOAresult,'F23','G3')
    xlswrite('result\F23Pos',LXWOApos,'LXWOA','G3')
    xlswrite('result\F23plotdata',LXWOAplotdata,'LXWOA','B2')      
end
end
 
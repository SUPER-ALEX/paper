%_________________________________________________________________________%
%  Whale Optimization Algorithm (WOA) source codes demo 1.0               %
%                                                                         %
%  Developed in MATLAB R2011b(7.13)                                       %
%                                                                         %
%  Author and programmer: Seyedali Mirjalili                              %
%                                                                         %
%         e-Mail: ali.mirjalili@gmail.com                                 %
%                 seyedali.mirjalili@griffithuni.edu.au                   %
%                                                                         %
%       Homepage: http://www.alimirjalili.com                             %
%                                                                         %
%   Main paper: S. Mirjalili, A. Lewis                                    %
%               The Whale Optimization Algorithm,                         %
%               Advances in Engineering Software , in press,              %
%               DOI: http://dx.doi.org/10.1016/j.advengsoft.2016.01.008   %
%                                                                         %
%_________________________________________________________________________%


% The Whale Optimization Algorithm
function [Leader_score,Leader_pos,Convergence_curve]=LXWOA(SearchAgents_no,Max_iter,lb,ub,dim,fobj,Positions)

%Initialize the positions of search agents
%Positions=initialization(SearchAgents_no,dim,ub,lb);
 % Calculate objective function for each search agent
for i=1:30
 fit(i)=fobj(Positions(i,:));
end
 [a,b]=min(fit);
% initialize position vector and score for the leader
Leader_pos=Positions(b,:);
Leader_score=a; %change this to -inf for maximization problems

t=1;% Loop counter
Convergence_curve=zeros(1,Max_iter);
Convergence_curve(t)=Leader_score;

% Main loop
while t<Max_iter
        
    a=2-t*((2)/Max_iter); % a decreases linearly fron 2 to 0 in Eq. (2.3)
    
    % a2 linearly dicreases from -1 to -2 to calculate t in Eq. (3.12)
    a2=-1+t*((-1)/Max_iter);
    
    % Update the Position of search agents 
    for i=1:size(Positions,1)
        r1=rand(); % r1 is a random number in [0,1]
        r2=rand(); % r2 is a random number in [0,1]
        
        A=2*a*r1-a;  % Eq. (2.3) in the paper
        C=2*r2;      % Eq. (2.4) in the paper
        
        
        b=1;               %  parameters in Eq. (2.5)
        l=(a2-1)*rand+1;   %  parameters in Eq. (2.5)
        
        p = rand();        % p in Eq. (2.6)
        
        for j=1:size(Positions,2)
            
            if p<0.5   
                 if abs(A)>=1
                    rand_leader_index = floor(SearchAgents_no*rand()+1);
                    X_rand = Positions(rand_leader_index, :);
                    D_X_rand=abs(C*X_rand(j)-Positions(i,j)); % Eq. (2.7)
                    Positions(i,j)=X_rand(j)-A*D_X_rand;      % Eq. (2.8)
                    
                elseif abs(A)<1
                    D_Leader=abs(C*Leader_pos(j)-Positions(i,j)); % Eq. (2.1)
                    Positions(i,j)=Leader_pos(j)-A*D_Leader;      % Eq. (2.2)
                end
                
            elseif p>=0.5
              
                distance2Leader=abs(Leader_pos(j)-Positions(i,j));
                % Eq. (2.5)
                Positions(i,j)=distance2Leader*exp(b.*l).*cos(l.*2*pi)+Leader_pos(j);
                
            end
            
        end
    end
    for i=1:size(Positions,1)
        
        % Return back the search agents that go beyond the boundaries of the search space
        Flag4ub=Positions(i,:)>ub;
        Flag4lb=Positions(i,:)<lb;
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        
        % Calculate objective function for each search agent
               
    end
    for i=1:30
        fitness(i)=fobj(Positions(i,:));
    end
        [best_fitness,i1]=min(fitness);
        [worstt_fitness,i2]=max(fitness);
        % Update the leader
        if best_fitness<Leader_score % Change this to > for maximization problem
            Leader_score=best_fitness; % Update alpha
            Leader_pos=Positions(i1,:);
%           else
%               Positions(i2,:)=Leader_pos;
%               fitness(i2)=Leader_score;
        end
        % appling Laplace Crossover
  [Positions fitness Leader_score Leader_pos]=LX(Positions,fitness,Leader_score,Leader_pos,fobj,SearchAgents_no,dim,lb,ub);
    t=t+1;
%     figure(1)
%     plot(Positions(:,1),Positions(:,2),'*')
%     xlim([-500 500]);ylim([-500 500]);
%     pause(0.1)
    Convergence_curve(t)=Leader_score;
    [t Leader_score];
end

end


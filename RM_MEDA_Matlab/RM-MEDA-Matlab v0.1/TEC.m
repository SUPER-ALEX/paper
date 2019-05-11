function TEC( )
%%%
% TEC( )  
%
%	Copyright (c) Aimin Zhou (2006-2007)
%     Department of Computer Science
%     University of Essex
%     Colchester, U.K, CO4 3SQ
%     amzhou@gmail.com
%
% History:
%     14/10/2006 create
%     15/11/2007 rewrite

% set parameters
Problem.Name    = 'ZDT';        % name of test problem
Problem.NObj    = 2;            % number of objectives
                                % 2 for F1 F2 F3 F5 F6 F7 F9 F10
                                % 3 for F4 F8
Problem.XLow    = zeros(30,1);  % lower boundary of decision variables, it also defines the number of decision variables
Problem.XUpp    = ones(30,1);   % upper boundary of decision variables
                                % [0,1] for all, for F9 and F10, x2...xn are extended to [0,10] before the fitness evaluation                                 
Problem.FObj    = @F1;          % Objective function, please read the definition
                                % F1 - F10

Generator.Name  = 'LPCA';       % name of generator
Generator.NClu  = 5;            % parameter of generator, the number of clusters(default) 
Generator.Iter  = 50;           % maximum trainning steps in LPCA
                                % usually, LPCA stops less than 10
                                % iterations
Generator.Exte  = 0.25;         % parameter of generator, extension rate(default)

NIni            = 100;          % population size
                                % 100 for F1 F2 F3 F5 F6 F7 F9 F10
                                % 200 for F4 F8
IterMax         = 100;          % number of generations
                                % 100 for F1 F2 F5 F6
                                % 200 for F4 F8
                                % 1000 for F3 F7 F9 F10
                                % or more for testing
% run 
disp('start');
disp(datestr(now));

Pareto = RMMEDA( Problem, Generator, NIni, IterMax );

disp(datestr(now));

disp('optimization result:');
disp(Pareto);

end

%%=========================================================================
%%Test functions
% important if there are constraints: 
%         hi(X) =  0 , i=1,2,...,k
%         hj(X) <= 0 , j=k+1,...,p
% V = |h1(X)|+ |h2(X)| + ... + |hk(X)| + max(0,hk+1(X)) + ... + max(0,hp(X)

% test problems used in TEC paper
    
function [F,V]  = F1(X)

    N   = size(X,1);
    X1  = X(2:N,:);
    G   = 1.0 + 9.0*(X1 - X(1))'*(X1 - X(1))/(N-1.0);

    F(1)= X(1);
    F(2)= G*(1.0-sqrt(F(1)/G));
    V   = 0.0; 
    
    clear X1;
end

function [F,V]  = F2(X)

    N   = size(X,1);
    X1  = X(2:N,:);
    G   = 1.0 + 9.0*(X1 - X(1))'*(X1 - X(1))/(N-1.0);

    F(1)= X(1);
    F(2)= G*(1.0-(F(1)/G)^2.0);
    V   = 0.0; 
    
    clear X1;
end

function [F,V]  = F3(X)

    N   = size(X,1);
    X1  = X(2:N,:);
    G   = 1.0 + 9.0*((X1 - X(1))'*(X1 - X(1))/9.0)^0.25;

    F(1)= 1.0-exp(-4.0*X(1))*sin(6.0*pi*X(1)).^6.0;
    F(2)= G*(1.0-(F(1)/G)^2.0);
    V   = 0.0; 
    
    clear X1;
end

function [F,V]  = F4(X)
    N   = size(X,1);
    X1  = X(3:N,:);
    G   = (X1 - X(1))'*(X1 - X(1));
    
    F(1) = cos(0.5*pi*X(1))*cos(0.5*pi*X(2))*(1.0+G);
    F(2) = cos(0.5*pi*X(1))*sin(0.5*pi*X(2))*(1.0+G);    
    F(3) = sin(0.5*pi*X(1))*(1.0+G);
    
    V    = 0.0;
    
    clear X1;
end

function [F,V]  = F5(X)

    N   = size(X,1);
    X1  = X(2:N,:).^2.0;
    G   = 1.0 + 9.0*(X1 - X(1))'*(X1 - X(1))/(N-1.0);

    F(1)= X(1);
    F(2)= G*(1.0-sqrt(F(1)/G));
    V   = 0.0; 
    
    clear X1;
end

function [F,V]  = F6(X)

    N   = size(X,1);
    X1  = X(2:N,:).^2.0;
    G   = 1.0 + 9.0*(X1 - X(1))'*(X1 - X(1))/(N-1.0);

    F(1)= X(1);
    F(2)= G*(1.0-(F(1)/G)^2.0);
    V   = 0.0; 
    
    clear X1;
end

function [F,V]  = F7(X)

    N   = size(X,1);
    X1  = X(2:N,:).^2.0;
    G   = 1.0 + 9.0*((X1 - X(1))'*(X1 - X(1))/9.0)^0.25;

    F(1)= 1.0-exp(-4.0*X(1))*sin(6.0*pi*X(1)).^6.0;
    F(2)= G*(1.0-(F(1)/G)^2.0);
    V   = 0.0; 
    
    clear X1;
end

function [F,V]  = F8(X)
    N   = size(X,1);
    X1  = X(3:N,:).^2.0;
    G   = (X1 - X(1))'*(X1 - X(1));
    
    F(1) = cos(0.5*pi*X(1))*cos(0.5*pi*X(2))*(1.0+G);
    F(2) = cos(0.5*pi*X(1))*sin(0.5*pi*X(2))*(1.0+G);    
    F(3) = sin(0.5*pi*X(1))*(1.0+G);
    V    = 0.0;
    
    clear X1;
end

function [F,V]  = F9(X)

    N   = size(X,1);
    X1  = (X(2:N,:)*10.0).^2.0;
    G   = 2.0 + (X1 - X(1))'*(X1 - X(1))/(4000.0)+ prod(cos((X1-X(1))./((1:N-1)'.^0.5)));

    F(1)= X(1);
    F(2)= G*(1.0-sqrt(F(1)/G));
    V   = 0.0; 
    
    clear X1;
end

function [F,V]  = F10(X)

    N   = size(X,1);
    X1  = (X(2:N,:)*10.0).^2.0;
    G   = 1.0 + 10.0*(N-1) + (X1 - X(1))'*(X1 - X(1))/(4000.0)- 10.0*sum(cos(2*pi*(X1-X(1))));

    F(1)= X(1);
    F(2)= G*(1.0-sqrt(F(1)/G));
    V   = 0.0; 
    
    clear X1;
end
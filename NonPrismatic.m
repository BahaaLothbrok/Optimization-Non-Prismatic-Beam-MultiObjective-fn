%% NonPrismatic Cantilever Beam 2
%% State Problem
% vars: D1, n, x, S_x, M_x, sigma_1, L, P
% Objective: Min(Volume);
%Constraints: 1/ Bending Stress -- sigma= 6P*Di/bi/hi^2 <= sima_max ;
%2/ End Deflection -- delta= (P*l^3/3/E)*(61/I1+37/I2+19/I3+7/I4+1/I5) <= delta_max ;
%3/ AR -- AR=hi/bi <= AR_max;
% Bounds -- 1 <= x1, x7, x9 <= 5, 30 <= x2, x8, x10 <= 65, 45 <= x4, x6 <=65;
% Bounds -- 2.4 <= x3, x5 <=3.1;
% Givens: l=100; delta_max= 2.7  sigma_max= 14000 E=2 e+07;

%% Solution
% Create Bounds
LB= [10 1 1];  %Lower Bound
UB= [50 5 5];  %Upper Bound

% Optimization Options
options = optimoptions(@gamultiobj,'PlotFcn',{@gaplotpareto,@gaplotscorediversity});
A = []; b = [];
Aeq = []; beq = [];
numberOfVariables=3;
FitnessFunction=@Volume;
[xbest, fbest, exitflag]= gamultiobj(FitnessFunction,numberOfVariables,[],[],[],[],LB,UB, @cantileverConstraints,options);


%optimization = optimoptions(@ga, 'MaxGenerations', 500, 'PopulationSize', 500 ...   , 'FunctionTolerance', 1e-10, 'EliteCount', 10, 'PlotFcn', {@gaplotbestf,@gaplotstopping});

% Run GA
%rng(0, 'twister');

%[xbest, fbest, exitflag] = ga(@Volume, 3, [], [], [], [], LB, UB, @cantileverConstraints, [1 2], optimization);

%display(xbest);
%fprintf('Best Volume returned by ga = %g\n', fbest);


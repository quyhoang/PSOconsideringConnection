function HBPSO_connect(objectiveFunction)
% SIMULATING HYBRID BOIDS-PSO ALGORITHM FOR MULTI-ROBOT SYSTEMS IN UNKNOWN ENVIRONMENT EXPLORATION
% AUTHOR: HOANG ANH QUY
% SUPERVISOR: PHAM MINH TRIEN, PhD.
% VNU-UET | MAY 2015
%
% objectiveFunction is one of the following:
% 'threeHumpCamel' (Three-Hump Camel Function),
% 'bohachevsky' (Bohachevsky Function),
% 'sphere'(Sphere Function),
% 'rosenbrock' (Rosenbrock Function)

% INITIALIZATION
global maxStep step swarm
clc; close all; %clear all; % clear previous data, clear screen
set(0, 'DefaultFigurePosition', [299, 0, 768, 768]); % make every graph fit my screen (1366*768)
setup_connect(objectiveFunction);


% SEARCHING
for step = 1:maxStep
    updateVelo(); % update velocity
    limitSpeed(); % Check speed limit
    updatePosition(); % update position
    calculateAlgebraicConnectivity(); % calculate lambda2
    newFit = fitness(swarm,objectiveFunction); % current fitness of the swarm
    updatePersonalBest(newFit); % update personal best
    updateGlobalBest(newFit); % update global best
    getData(newFit); % Collect data to visualize results
end

% DISPLAY RESULTS
visualize_connect(objectiveFunction);
showConnectivity();
showResult();

end

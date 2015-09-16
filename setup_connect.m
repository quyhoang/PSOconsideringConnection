function setup_connect(objectiveFunction)
% SET UP THE SIMULATION

global noParticle range spaceSize vLimitX vLimitY maxStep commuRange ...
    dwLimit_1 upLimit_1 dwLimit_2 upLimit_2 w c1 c2 sensingRange swarm velo...
    fit swarmX swarmY gBest gBestVal pBest pBestVal BestFitnessEver MeanFitnessEver...
    staticObs up dw

k = fopen('initialize.txt');

noParticle = fscanf(k,'noParticle = %d\n'); % number of particles 
maxStep = fscanf(k,'maxStep = %d\n'); % number of iterations
range = fscanf(k,'range = %d\n'); % physical radius of a particle
sensingRange = range*ones(1,noParticle);

% Coefficients ------------------------------------------------------------
w = linspace(1,1,maxStep);
c1 = linspace(2,0.1,maxStep);
c2 = linspace(0.1,2,maxStep);

% Space initialization ----------------------------------------------------
upLimit_1 = fscanf(k,'upLimit_1 = %d\n'); dwLimit_1 = fscanf(k,'dwLimit_1 = %d\n'); assert(dwLimit_1 < upLimit_1); %1: x, 2: y
upLimit_2 = fscanf(k,'upLimit_2 = %d\n'); dwLimit_2 = fscanf(k,'dwLimit_2 = %d\n'); assert(dwLimit_2 < upLimit_2);

% Virtual limit for avoiding collision with boundaries --------------------
dw = repmat([dwLimit_1; dwLimit_2],1,noParticle) + range;
up = repmat([upLimit_1; upLimit_2],1,noParticle) - range; % the swarm's coverage is almost all the space, except for four corners.
spaceSize = up - dw;

swarm = dw + 0.2*rand(2,noParticle).*spaceSize; % initial position --------
   

veloScale = fscanf(k,'veloScale = %f\n'); % the ratio of maximum velocity over particle size -------
vLimitX = veloScale*range;
vLimitY = veloScale*range;
velo = repmat([vLimitX; vLimitY],1,noParticle); % initial velocity

commuRange = fscanf(k,'commuRangeRatio = %d\n')*range; % communication range, connected distance ----------

fit = fitness(swarm,objectiveFunction);
swarmX = zeros(maxStep,noParticle);
swarmY = zeros(maxStep,noParticle);

[gBestVal,gBestIndex] = min(fit);
gBest = repmat(swarm(:,gBestIndex),1,noParticle);

pBest = swarm; % initial personal best
pBestVal = fitness(pBest,objectiveFunction);

BestFitnessEver = zeros(1,maxStep);
MeanFitnessEver = zeros(1,maxStep);

fclose(k);
obsGenerator(objectiveFunction);

end

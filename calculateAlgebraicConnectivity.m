function calculateAlgebraicConnectivity()
% Calculate lambda2

global noParticle swarm commuRange step lambda2

% Adjacency Matrix
A = zeros(noParticle,noParticle);
for i1 = 1:noParticle
    for i2 = (i1+1):noParticle
        if r(swarm(:,i1),swarm(:,i2)) < commuRange
            A(i1,i2) = 1;
            A(i2,i1) = 1;
        end
    end
    A(i1,i1) = 0;
end

% Degree Matrix
D = zeros(noParticle,noParticle);
for i1 = 1:noParticle
    for i2 = 1:noParticle
        if (r(swarm(:,i1),swarm(:,i2)) < commuRange) && i1 ~= i2
            D(i1,i1) = D(i1,i1)+1;
        end
    end
end

% Laplacian Matrix
L = D - A;

eigen = sort(eig(L));    lambda2(step) = eigen(2);
end



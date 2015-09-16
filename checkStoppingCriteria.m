function stop = checkStoppingCriteria(objectiveFunction)

global commuRange noParticle swarm targets step
persistent mark
% mark is now empty
if isempty(mark)
    mark = 1;
end


% Check whether the swarm converges, if so, stop searching
converge = 0;
switch objectiveFunction
    case 'singleLuna'
        for i = 1:noParticle
            if r(swarm(:,i),targets(1:2,1)) < commuRange + 2
                converge = converge + 1;
            end
        end
    case 'doubleLuna'
        for i = 1:noParticle
            if r(swarm(:,i),targets(1:2,1)) < commuRange + 2
                converge = converge + 1;
            end
            if r(swarm(:,i),targets(1:2,2)) < commuRange + 2
                converge = converge + 1;
            end
        end
    case 'tripleLuna'
        for i = 1:noParticle
            if r(swarm(:,i),targets(1:2,1)) < commuRange + 2
                converge = converge + 1;
            end
            if r(swarm(:,i),targets(1:2,2)) < commuRange + 2
                converge = converge + 1;
            end
            if r(swarm(:,i),targets(1:2,3)) < commuRange + 2
                converge = converge + 1;
            end
        end
end

if (converge > 5) && ((step - mark) > 20)
    mark = step;
    stop = 1;
    disp(step);
else stop = 0;
end

end


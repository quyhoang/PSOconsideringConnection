function visualize_connect(objectiveFunction)

global maxStep commuRange sensingRange dwLimit_1 upLimit_1 dwLimit_2 upLimit_2 ...
    staticObs BestFitnessEver step swarmX swarmY lambda2

[xx,yy,zz] = objFun(objectiveFunction);
WAIT = .1;

for step = 1:maxStep
    
    clf; % clear figure
    rectangle('Position',[-1.5,-1.5,3,3],'FaceColor','r'); % emphasize target
    hold on;
    
    if step == maxStep
      drawContour(xx,yy,zz,step);
    end
    
    % draw obstacles
    scatter(staticObs(1,:),staticObs(2,:),1000,'m','filled');
    hold on;
    
    xlabel('x coordinator','FontSize',16); ylabel('y coordinator','FontSize',16)
%     str = ['Step: ',num2str(step),'\it \color[rgb]{0.2,0.5,0.5} Best Value = ', num2str(gBestVal)];
%     title(str,'FontSize',18);
    str = ['Step: ',num2str(step),'\it \color[rgb]{0.2,0.5,0.5} Best Value = ', num2str(BestFitnessEver(step))];
    title(str,'FontSize',18);
    set(gca,'fontsize',16); hold on;
    
    swarmStep = [swarmX(step,:);swarmY(step,:)]';
    scatter(swarmX(step,:),swarmY(step,:),110,[0 0 1],'filled'); % visual alternation of the above line, draw all the swarm with each particle's size
    
    viscircles(swarmStep,commuRange*sensingRange,'EdgeColor','g','LineWidth',0.1); % draw communication range
    axis([dwLimit_1-1 upLimit_1+1 dwLimit_2-1 upLimit_2+1]); hold on;
    
    % Show lambda2 in each step
    str2 = {['\lambda_2 = ',num2str(lambda2(step))]};
    annotation('textbox', [0.66,0.7,0.1,0.1],'String', str2) % add notation on graph
    
    pause(WAIT);
    
end
    % save('arrangePost.mat','swarm');
end


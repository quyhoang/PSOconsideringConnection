function showConnectivity()
% Show connectivity during the exploration

global lambda2 maxStep noParticle

figure;
plot(lambda2,'LineWidth',2); grid;
title('Algebraic Connectivity','Fontsize',20);
xlabel('Step','FontSize',15); 
ylabel('\lambda_2','FontSize',15)
set(gca,'fontsize',16);
axis([0 maxStep -0.2 noParticle+0.2]);
% saveas(gcf,'Algebraic Connectivity','fig');
pause(2);

end


function drawContour(xx,yy,zz,step)
% Draw contour with parameter defined in objFun
contourf(xx,yy,zz);
saveas(gcf,num2str(step),'emf');
end


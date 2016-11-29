function [] = PlotTorusPts(x,R,r)
%Creates a torus with grid lines and points given by the Nx3 array x.
     [u,v]=meshgrid(0:10:360);
     xx=(R+r*cosd(v)).*cosd(u);
     yy=(R+r*cosd(v)).*sind(u);
     zz=r*sind(v);
     
     %Torus will be yellow and grid lines will be grey
     clr = [255 255 102]/255;
     figure
     hold on;
     
     surf(xx,yy,zz,'EdgeColor',[0.8,0.8,0.8],'FaceColor',clr)
     axis equal;
     
     plot3(x(:,1),x(:,2),x(:,3),'k.','MarkerSize',6);
     hold off;
end
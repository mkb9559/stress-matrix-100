clc;
clear all;
load("Omega.mat");
load("nominal.mat");
n=100;
I2=diag([1 1]);
P=reshape(pd',200,1);

p0=(100*rand(2*n,1)-50);

Omega=-Omega;

error=norm(kron(Omega,I2)*P);
Fsize = 10;

ed=0;
figure(1);
box on;
hold on; axis equal;
for i=1:n
    for j=i+1:n
        if abs(Omega(i,j))>0.001
            pi=pd(i,:);
            pj=pd(j,:);
            line([pi(1) pj(1)],[pi(2) pj(2)], [0 0],'Color','b','LineWidth',1);
            ed=ed+1;
        end
    end
end
ed

% plot nodes
for i=1:n
    pi=pd(i,:);
    if(i==49||i==75||i==99)
        plot3(pi(1), pi(2), 1, 'o', ...
        'MarkerSize', Fsize-4,...
        'linewidth', 1,...
        'MarkerEdgeColor', 'g',...
        'markerFaceColor', 'white');
    else
        plot3(pi(1), pi(2), 1, 'o', ...
            'MarkerSize', Fsize-4,...
            'linewidth', 1,...
            'MarkerEdgeColor', 'r',...
            'markerFaceColor', 'white');
    
    end
end
axis([-25 17 -15 20]);
set(gca,'FontSize',Fsize+3);
xlabel('${x}(m)$','fontsize',Fsize+3,'interpreter','latex');
ylabel('${y}(m)$','fontsize',Fsize+3,'interpreter','latex');






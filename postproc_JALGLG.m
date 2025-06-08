% Export p, t, e, u to workspace

area = pdetrg(p,t);

N1 = 50; % exciter coil
N2 = 5; % measuring coil

F1 = 40e-6; %[mm2] exciter coil area
F2 = 2.5e-6; %[mm2] measuring coil area

size_u=size(u);
Psi1 = zeros(1,size_u(2));
Psi2 = zeros(1,size_u(2));

r_tri = pdeintrp(p,t,p(1,:)'); 
indExc = find(t(4,:) == 3); % exciter coil
indMea = find(t(4,:) == 2); % measuring coil

for i=1:size_u(2)
    u_now=u(:,i);
    rAphi1_tri = pdeintrp(p,t,u_now); 

    
    if rem(i,10)==0
        display(size_u(2)-i); % this just displays the remaining steps
    end
    Psi1(i) = 2*N1/F1*sum( 2*pi*rAphi1_tri(indExc).*area(indExc) );
    Psi2(i) = 2*N2/F2*sum( 2*pi*rAphi1_tri(indMea).*area(indMea) );
end

%% plot
close all;
figure();
hold on;
grid on;
dt=linspace(0,500,size_u(2));
plot(dt,Psi1,'LineWidth',2);
plot(dt,Psi2,'LineWidth',2);

xlabel("t [μs]")
ylabel("Ψ [Wb]")
legend("Exciter coil","Measuring coil")

figure();
hold on;
grid on;
xlabel("t [μs]")
ylabel("Ψ [Wb]")
title("Measuring coil")
plot(dt,Psi2,'LineWidth',2);
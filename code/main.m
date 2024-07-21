clear all
close all
clc

%% SAMPLING TIME
Ts=0.001;

g = 9.81;
e_3 = [0 0 1]';

%uT_0 = 12;                     
uT_0 = 11.772;   
    
%% UAV PARAMETERS
mass = 1.2;
Ib = diag([1.2416 1.2416 2*1.2416]); 

%% apf

%choice=1;         % planner with polynomial equation
choice=2;        % planner with apf


%% choice of obstacles


 % % % % %genration of random cylinder
% quantity=2;
% obs=random_cylinder(quantity);
%cylinders
%obsta_1 is for simulation of the apf 

obsta_1=[8 -1 2.5 0 10];           %[center_x center_y radius z_min z_max]
%obsta_2=[3 4 0.5 0 8];


%% Staritng and Final posistion
x0= 1; xf=19;
y0= -1; yf=-1; 
z0= -5; zf=-5; 

planner;


%gains for geometric controller
Kp = diag([100 100 100]);
Kv = diag([8 8 8]);
Kr = diag([20 20 3.5]);
Kw = diag([5 6.5 2.5]);


%gains for hierarchical controller
% newKp = diag([1 1 1]);
% newKv = diag([0.5 0.5 0.5]);

newKp = diag([30 30 30]);
newKv = diag([5 5 5]);
newKP=[newKp newKv];

% Ketap = diag([1 1 1]);
% Ketav = diag([0.7 0.7 0.7]);

Ketap = diag([30 30 30]);
Ketav = diag([7 7 7]);
newKE=[Ketap Ketav];



output=sim("hierarchical_controll.slx",'StopTime','40');
% 
% 
% 
vettore_legenda= {'$$err_{x}$$','$$err_{y}$$','$$err_{z}$$'};
profplot2(output.tout,output.err_pos.Data,'time[sec]','position[m]',"Position error",vettore_legenda,'errPos.pdf');
% 
vettore_legenda= {'$$err_{\dot x}$$','$$err_{\dot y}$$','$$err_{\dot z}$$'};
profplot2(output.tout,output.err_vel.Data,'time[sec]','velocity[m/s]',"Velocity error",vettore_legenda,'errVel.pdf');
% 
 vettore_legenda= {'$$err_{\phi}$$','$$err_{\theta}$$','$$err_{\psi}$$'};
 profplot2(output.tout,squeeze(output.err_eta.Data),'time[sec]',' ',"Attitude error",vettore_legenda,'errOrient.pdf');
% 
 vettore_legenda= {'$$err_{\dot \phi}$$','$$err_{\dot \theta}$$','$$err_{\dot \psi}$$'};
 profplot2(output.tout,squeeze(output.err_eta_dot.Data),'time[sec]',' ',"Attitude velocity error",vettore_legenda,'errAngVel.pdf');
% 
vettore_legenda= {'$$u_T$$'};
profplot2(output.tout,output.uT.Data,'time[sec]','$$u_{T}\ [N]$$',"Commanded Thrust",vettore_legenda,'commThrust.pdf');
% 
 vettore_legenda= {'$$\tau_{x}$$','$$\tau_{y}$$','$$\tau_{z}$$'};
 profplot2(output.tout,squeeze(output.tau_b.Data),'time[sec]','toruqe\ [Nm]',"Commanded Torque",vettore_legenda,'commTorque.pdf');
% 
% 


%for apf
vettore_legenda= {'$$err_{x}$$','$$err_{y}$$','$$err_{z}$$'};
profplot2(output.tout,squeeze(output.err_pos.Data),'time[sec]','position[m]',"Position error",vettore_legenda,'errPos.pdf');
% 
vettore_legenda= {'$$err_{\dot x}$$','$$err_{\dot y}$$','$$err_{\dot z}$$'};
profplot2(output.tout,squeeze(output.err_vel.Data),'time[sec]','velocity[m/s]',"Velocity error",vettore_legenda,'errVel.pdf');
%  
vettore_legenda= {'$$err_{\phi}$$','$$err_{\theta}$$','$$err_{\psi}$$'};
 profplot2(output.tout,squeeze(output.err_eta.Data),'time[sec]',' ',"Attitude error",vettore_legenda,'errOrient.pdf');
% 
 vettore_legenda= {'$$err_{\dot \phi}$$','$$err_{\dot \theta}$$','$$err_{\dot \psi}$$'};
 profplot2(output.tout,squeeze(output.err_eta_dot.Data),'time[sec]',' ',"Attitude velocity error",vettore_legenda,'errAngVel.pdf');
% 
vettore_legenda= {'$$u_T$$'};
profplot2(output.tout,squeeze(output.uT.Data),'time[sec]','$$u_{T}\ [N]$$',"Commanded Thrust",vettore_legenda,'commThrust.pdf');
% 
 vettore_legenda= {'$$\tau_{x}$$','$$\tau_{y}$$','$$\tau_{z}$$'};
 profplot2(output.tout,squeeze(output.tau_b.Data),'time[sec]','toruqe\ [Nm]',"Commanded Torque",vettore_legenda,'commTorque.pdf');
% 
 vettore_legenda= {'$$f_{a,x}$$','$$f_{a,y}$$','$$f_{a,z}$$'};
 profplot2(output.tout,squeeze(output.Fa.Data),'time[sec]','Force',"attractive force",vettore_legenda,'attr_force.pdf');
% 
 vettore_legenda= {'$$f_{b,x}$$','$$f_{b,y}$$','$$f_{b,z}$$'};
 profplot2(output.tout,squeeze(output.Fb.Data),'time[sec]','Force',"repulsive force",vettore_legenda,'rep_force.pdf');
% 




%% create a scenario fo the uav and its local origin
piazza = uavScenario("UpdateRate",1/Ts,"ReferenceLocation",[0, 0, 0]);
 



%simple mesh to visualize the starting position
%addMesh(piazza,"cylinder",{[0 0 1] [0 .01]},[0 1 0]);


% Create a ground         %4 point of the base of the scenary %then how tall is %the last vector is the color   
addMesh(piazza,"polygon",{[-5 -5; 20 -5; 20 20; -5 20] [-0.5 0]},[0.3 0.3 0.3]);

%% Add obstacles meshes

%uncomment for randome cylinder generation
% for k=1:quantity
% addMesh(piazza,"cylinder",{[obs(k,1:3)] [obs(k,4:5)]},[1 0 0]);
% end

addMesh(piazza,"cylinder",{[obsta_1(1:3)] [obsta_1(4:5)]},[1 0 0]);


platform = uavPlatform("UAV_platform",piazza,ReferenceFrame="NED",...
    InitialPosition=pos_0,InitialOrientation=eul2quat(orient_0));
%create a uav platform for the scenario
% %platUAV = uavPlatform("UAV_plat",Scenario, ...
%                       "ReferenceFrame","NED", ...
%                       "InitialPosition",InitialPosition, ...
%                       "InitialOrientation",eul2quat(InitialOrientation));


updateMesh(platform,"quadrotor",{1},[0 0 1],eul2tform([0 0 pi]));

show3D(piazza);


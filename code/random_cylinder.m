function obs = random_cylinder(num_cylinder)

temp=[0,0,0,0,0];
for i=1:num_cylinder
    x=randi([-4, 19]);
    y=randi([-4,19]);
    raggio=0.1+(2-0.1)*rand;
    z_min=0;
    z_max=randi([1, 15]);
    temp=[x,y,raggio,z_min,z_max];
    obs(i,:)=[temp];
end
/// @description 
randomize();
image_speed = 0;
rotSpeed = irandom_range(5, 10);
vSpeed = irandom_range(-10, -30);
hSpeed = 0//irandom_range(5, 15);
grav = .3;

timer = (2 + random_range(0, .05)) * room_speed;

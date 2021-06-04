Full Prototype: https://docs.google.com/document/d/1fEMFAlfaBmn7HHuVP-jK5PY6FVlbdV34sk8eBeWni6I/edit?usp=sharing

Group Name: 2D Supersonic Acrobatic Rocket-Powered Battle-Cars

Group Members: Emmanuel Abayev, Harry Pan

Brief Project Description (1 paragraph summary):
This project is intended to emulate the popular vehicular soccer game, Rocket League, developed by Psyonix. 
Of course, we’re doing this on a much smaller scale than the original game, as we’re turning the 3D game 
into a 2D knockoff of it. The goal of the game is simple: use your car to hit a ball into the opposing net 
and score more goals than your opponent. We intend to make this a two-player game and develop this project 
in Processing.

UML Diagram Link: https://lucid.app/lucidchart/911454f5-4ca5-45c0-a283-1028df9958a3/edit?beaconFlowId=62B0535290E07E75&page=0_0#

Compile/Run instructions: It's in Processing, so just hit run!

Development Log (Harry)
-----------------------
5/25/2021 

We wrote the code for the skeleton of our project. Long road ahead!

5/26/2021

We worked on the display and movement of the cars. Keybinds are working and acceleration and gravity do too! Bright road ahead!

5/27/2021

We worked on slowing down the car when the keybind for accelerate is released. We also worked on gravity for the ball.

5/29/2021

We brought some color to the displays. Established walls, timer and scoreboard. Cars can now touch each other. Attempted deceleration but left a lot to be desired.

6/1/2021

We further improved collisions, making the "jump" a little more accurate in relation to speed and direction. We weakened gravity and are now working on a rudimentary background.

6/3/2021

Started car-ball collisions, boosting, and car rotation. Very complicated stuff. We'll make it work soon enough.

Development Log (Emmanuel)
--------------------------
5/25/2021

During class time, worked with Harry in the breakout room on setting up our basic structure. We succeeded in fitting our 4 files with the methods and instance variables, as well as their constructors, that we outlined in our UML. Long road ahead is right!

5/26/2021

Our goal was to get the cars moving, and it was done. Harry drew the cars and wrote inside the car class to change the dx and dy values of the cars, and I went into the RocketLeague class and initialized a ball and two cars, and then worked on the gravity and keybinds controling upward and sideward movement of cars. We came together and fixed up our gravity issues, and at the end of the day, the cars now have fully functional 2D movement.

5/27/2021

Today in class, I focused on refining movement. I made it so it was not tap to move, but press and hold to move, and I also eliminated double jumping. I then worked both on decelleration so it isnt a sudden stop, and implementing walls. Towards the end of class, Harry discovered a bug where pressing left and right would cause the speed to skyrocket, so those three things will be next session's goals.

5/29/2021

In this session, I added bumping, where cars don't just pass through each other, and instead collide. I also added boundaries so the cars won't fly off of the map. We then worked together on adding acceleration and deccelleration to cars, and experimented with removing our key released method, but couldn't come up with a concrete solution.

6/1/2021

Today, I focused a lot on aesthetics, and making it look more like a stadium. It's not quite there yet, there's a blue sky and grass. I experimented with spotlights and people in some stands, but that didn't work out that well, so I'll try that again in the future. I did spend some time on making goals and the nets in the background took some time as well. The next step would be to get that functional.

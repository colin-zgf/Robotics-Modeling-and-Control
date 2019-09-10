# Walking Robots

In this section, a simple one-leg motion is first presented followed by a four-leg robots motion.

## One-Leg Motion

Before design the one-leg, one needs to define the path that the end-effector of the leg and its foot will follow. In this case, the foot moves backwards in the ground plane with a limited range of movement so that it cannot move backward for very long. At some point we must reset the let - lift the foot, move it forward and place it on the ground again. Thus, we define the forward and backward limits of leg motion in the x-diretion to be 50mm and 50mm, respectively. Furthermore, the foot is 50mm below the hip when it is down and 20mm below the hip during reset. The path comprise a complete cycle correspond to the start of stance shown in the figure below.

![alt tag](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/image/path.png)

The path and corresponding segments are listed in the table below:

Point $i$ | $x$-coordinate | $y$-coordinate | $z$-coordinate
-----| --------|--------------|---------
1|    0.0500  |  0.0500  |  0.0500
2|   -0.0500  |  0.0500  |  0.0500
3|   -0.0500  |  0.0500  |  0.0200
4|    0.0500  |  0.0500  |  0.0200
5|    0.0500  |  0.0500  |  0.0500

The time consumption for 1->2, 2->3, 3->4, and 4->5 are 3s, 0.25s, 0.5s, and 0.25s, repectively. That means it takes the leg 3/4 of the cycle for moving from froward to backward with the rest 1/4 cycle for resetting. If we set the time step 0.01s, then there will be 400 points for each cycle.

The [one-leg motion code](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/code/SImpleWalkingRobot.m) shows the process for one leg motion. The results is shown below:

![](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/image/1_one_leg_motion.gif)

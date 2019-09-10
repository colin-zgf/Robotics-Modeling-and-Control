---
layout: post
mathjax: true
comments: true
---

# Walking Robots

In this section, a simple one-leg motion is first presented followed by a four-leg robots motion.

## One-Leg Motion

Before design the one-leg, one needs to define the path that the end-effector of the leg and its foot will follow. In this case, the foot moves backwards in the ground plane with a limited range of movement so that it cannot move backward for very long. At some point we must reset the let - lift the foot, move it forward and place it on the ground again. Thus, we define the forward and backward limits of leg motion in the x-diretion to be 50mm and 50mm, respectively. Furthermore, the foot is 50mm below the hip when it is down and 20mm below the hip during reset. The path comprise 

---
layout: post
mathjax: true
comments: true
---
# Forward and Inverse Kinematics

In this part, we will discuss the basic knowledge of forward and inverse kinematics.

## Forward Kinematics

The Devavit-Hartenberg, or DH convention, is a commonly used convention for selecting frame of reference in robotic applications. A very important homogenous transformation $A_{i}$ is defined as the product of four basic transformations: rotation about $z$ axis, translation about $z$ axis, rotation around $x$ axis, and translation around $x$ axis.

$$A_{i} = \begin{pmatrix}\cos(\theta_{i}) & -\sin(\theta_{i})\cos(\alpha_{i}) & \sin(\theta_{i})\sin(\alpha_{i}) & a_{i}\cos(\theta_{i}) \\\ 
\sin(\theta_{i}) & \cos(\theta_{i})\cos(\alpha_{i}) & -\cos(\theta_{i})\sin(\alpha_{i}) & a_{i}\sin(\theta_{i}) \\\ 
0 & sin(\alpha_{i}) & cos(\alpha_{i}) & d_{i} \\\ 
0 & 0 & 0 & 1\end{pmatrix}$$

where  $a_{i}$, and $\alpha_{i}$, $d_{i}$, $\theta_{i}$, are **link length**, **link twist**, **link offset**, and **joint angle**. It turns out that $a_{i}$ and $\alpha_{i}$ are constant once given the robot configurations. $\theta_{i}$ works for a revolute joint and $d_{i}$ works for a prismatic joint. 

The physical meaning of **link length**, **link twist**, **link offset**, and **joint angle** are given below:

- **link length** $a_{i}$: the distance between the axies $z_{i-1}$ and $z_{i}$, and is measured along the axis $x_{i}$;
- **link twist** $\alpha_{i}$: the angle between the axies $z_{i-1}$ and $z_{i}$, and is measured in a plane normal to axis $x_{i}$; The positive sense for $\alpha_{i}$ is determined from $z_{i-1}$ to $z_{i}$ by the right-handed rule.
- **link offset** $d_{i}$: the perpendicular distance from the origin $o_{i-1}$ to the intersection of the $x_{i}$ axis with $z_{i-1}$ measured along the $z_{i-1}$ axis;
- **joint angle** $\theta_{i}$: the angle between $x_{i-1}$ and $x_{i}$, and is measured in the plane normal to $z_{i-1}$.

![alt tag](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/image/2-link-robots.png '2 link')

The DH table for 2-Link Planar Mnipulator above is shownd in the table below.

Link | $a_{i}$ | $\alpha_{i}$ | $d_{i}$ | $\theta_{i}$
-----| --------|--------------|---------|-----------
1 | $a_{1}$ | 0 | 0 | $\theta^*_{1}$
2 | $a_{2}$ | 0 | 0 | $\theta^*_{2}$

Based on the parameter in the table above, the corresponding homogenous transformations are:

$$A_{1} = \begin{pmatrix}\cos(\theta_{1}) & -\sin(\theta_{1}) & 0 & a_{1}\cos(\theta_{1}) \\\ 
\sin(\theta_{1}) & \cos(\theta_{1}) & 0 & a_{1}\sin(\theta_{1}) \\\ 
0 & 0 & 1 & 0 \\\ 
0 & 0 & 0 & 1\end{pmatrix}$$

$$A_{2} = \begin{pmatrix}\cos(\theta_{2}) & -\sin(\theta_{2}) & 0 & a_{2}\cos(\theta_{2}) \\\ 
\sin(\theta_{2}) & \cos(\theta_{2}) & 0 & a_{2}\sin(\theta_{2}) \\\ 
0 & 0 & 1 & 0 \\\ 
0 & 0 & 0 & 1\end{pmatrix}$$

Thus, the product, or the **transformation matrix**, is:

$$T^0_{2} = A_{1}A_{2} = \begin{pmatrix}\cos(\theta_{1} + \theta_{2}) & -\sin(\theta_{1} + \theta_{2}) & 0 & a_{1}\cos(\theta_{1}) + a_{2}\cos(\theta_{1} + \theta_{2}) \\\ 
\sin(\theta_{1} + \theta_{2}) & \cos(\theta_{1} + \theta_{2}) & 0 & a_{1}\sin(\theta_{1}) + a_{2}\sin(\theta_{1} + \theta_{2}) \\\ 
0 & 0 & 1 & 0 \\\ 
0 & 0 & 0 & 1\end{pmatrix}$$

where the superscript 0 and subscript 2 of $T$ means the base coordinate and the end-effector coordinate where the coordinate of end-effector in this case is $o_{2}x_{2}y_{2}z_{2}$. One interesting thing is the last column of $T^0_{2}$ which gives the coordinate $o_{2}x_{2}y_{2}z_{2}$ expressed in the base frame $o_{0}x_{0}y_{0}z_{0}$. And from the 2-Link Planar Mnipulator above, it is easy to verify that is the case.

## Inverse Kinematics

The problem of inverse kinetics is: get the required joint coordinates given the desired pose of the end-effector. Usually, the inverse kinematics problem is the real practical interest. In general the solution of inverse kinematics is not unique and for some classes of manipulator no closedform solution exists, necessitating a numerical solution.

A necessary condition for a closed-form solution of a 6-axis robot is that the three wrist axes intersect at a single point. This means that motion of the wrist joints only changes the end-effector orientation, not its translation. Such a mechanism is known as a spherical wrist and almost all industrial robots have such wrists.

The following presents some attempts to solve the inverse kinematics:

### The General Inverse Kinematic Problem

From the previous forward kinematics, it shows the forward kinematics problem always has a unique solution that can be obtained simply by evaluating the forward equations. Thus, suppose that the desired position and orientation of the final frame are given, there will be twelve equations to find the corresponding joint variables. However, it is much too difficult to solve it directly in close form which is the case for most robot arms since the inverse kinematics problem may or may not have a solution. Even if a solution exits, it may or may not be unique. Furthermore, because these forward kinematic equations are in general complicated non-linear functions of the joint variable, the solutions may be difficult to obtain even when they exits.

### Kinematic Decouplig

For the six-DOF manipulator, it is possible to decouple the inverse kinematics problem into two simpler problems: inverse position kinematics, and inverse orientation kinematics. Namely, first finding the position of the intersecton of the wrist axes, hereafter called the **wrist center**, and then finding the orientation of the wrist.

1. Inverse Position. One can solve the joint variable ($\theta_{i}$ or $d_{i}$) by projecting the manipulator onto the $x_{i-1}$-$y_{i-1}$ plane and solving a simple trigonometry problem. To illustrate the point easily, we still choose the 2-Link Manipulator as the example. Assume the projection of $o_{2}$ are $r$ and $s$ on $x_{0}$ and $y_{0}$. Then one can apply the law of cosines to obtain:

$$\begin{align}\cos(\theta_{2}) = \frac{r^2 + s^2 - a^2_{1} - a^2_{2}}{2a_{1}a_{2}} := D \end{align}$$

$$\begin{align}\theta_{2} =atan2(D, \pm \sqrt{1 - D^2})\end{align}$$

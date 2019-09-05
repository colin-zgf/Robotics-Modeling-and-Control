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

![alt tag](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/image/2-link-robots.png '2 link')

The DH table for 2-Link Planar Mnipulator above is shownd in the table below.

Link | $a_{i}$ | $\alpha_{i}$ | $d_{i}$ | \theta_{i}
-----| --------|--------------|---------|-----------
1 | $a_{1}$ | $\alpha_{1}$ | $d_{1}$ | $\theta_{1}$
2 | $a_{2}$ | $\alpha_{2}$ | $d_{2}$ | $\theta_{2}$



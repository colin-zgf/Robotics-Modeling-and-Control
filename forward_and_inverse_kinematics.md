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

where $$\theta_{i}$$, $$d_{i}$$, $$a_{i}$$, and $$\alpha_{i}$$ are **joint angle**, **link offset**, **link length**, and **link twist**. It turns out that $$a_{i}$$ and $$\alpha_{i}$$ are constant once given the robot configurations. $$\theta_{i}$$ works for a revolute joint and $$d_{i}$$ works for a prismatic joint. The 2-link robots below shows how those four terms are calculated.

![alt tag](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/image/2-link-robots.png '2 link')

First Header | Second Header
-------- | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column



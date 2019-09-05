---
layout: post
mathjax: true
comments: true
---
# Forward and Inverse Kinematics

In this part, we will discuss the basic knowledge of forward and inverse kinematics.

## Forward Kinematics

The Devavit-Hartenberg, or DH convention, is a commonly used convention for selecting frame of reference in robotic applications. A very important homogenous transformation $A_{i}$ is defined as the product of four basic transformations: rotation about $z$ axis, translation about $z$ axis, rotation around $x$ axis, and translation around $x$ axis.

$A_{i}$ = $$\begin{pmatrix}\cos(\theta_{i}) & 2 & 3\\\ 
4 & 5 & 6\\\ 
7 & 8 & 9\end{pmatrix}$$

$$ r = h = \sqrt{\frac {1} {2}} = \sqrt{\frac {N} {N+1}} \sqrt{\frac {N+1} {2N}} $$

![alt tag](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/image/2-link-robots.png '2 link')

First Header | Second Header
-------- | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column


$\theta$
$\alpha$
$\alpha_{1}$

$$\begin{pmatrix}1 & 2 & 3\\\ 
4 & 5 & 6\\\ 
7 & 8 & 9\end{pmatrix}$$


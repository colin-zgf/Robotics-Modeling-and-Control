# Differential Kinematic Control Equations for Manipulators

In this section, we will discuss a general method for obtaining the Jacobian with differential change in position and orientation as dependent variables and differential change in joint variables as independent variables.

## Coordinate Frame attached to the end-effector

For arm-type robots, the axis of the tool/end-effector is associated with the $z$-axis by convention and is called the **approach vector** and denoted **$\hat{a}$**=($a_{x}, a_{y}, a_{z}$). However, only specifying the direction of the $z$-axis is insufficient to describe the coordinate frame. Thus, one also needs to specify the direction of the $x$- and $y$-axes. The **orientation vector** that provides orientation and is orthogonal to approach vector is defined as **$\hat{o}$**=($o_{x}, o_{y}, o_{z}$). These two unit vectors are sufficient to completely define the rotation matrix since the remaining column can be computed using **$\hat{n}$**=**$\hat{o}$** x **$\hat{a}$** where **$\hat{n}$** is called the **normal vector**.

![alt_tag](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/image/end_effector.png)

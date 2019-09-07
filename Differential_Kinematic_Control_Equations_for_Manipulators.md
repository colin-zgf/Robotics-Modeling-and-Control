# Differential Kinematic Control Equations for Manipulators

In this section, we will discuss a general method for obtaining the Jacobian with differential change in position and orientation as dependent variables and differential change in joint variables as independent variables.

## Coordinate Frame attached to the end-effector

For arm-type robots, the axis of the tool/end-effector is associated with the $z$-axis by convention and is called the **approach vector** and denoted **$\hat{a}$**=($a_{x}, a_{y}, a_{z}$). However, only specifying the direction of the $z$-axis is insufficient to describe the coordinate frame. Thus, one also needs to specify the direction of the $x$- and $y$-axes. The **orientation vector** that provides orientation and is orthogonal to approach vector is defined as **$\hat{o}$**=($o_{x}, o_{y}, o_{z}$). These two unit vectors are sufficient to completely define the rotation matrix since the remaining column can be computed using **$\hat{n}$**=**$\hat{o}$** x **$\hat{a}$** where **$\hat{n}$** is called the **normal vector**. Those three vectors are shown in the picture below.

![alt_tag](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/image/end_effector.png)

And the corresponding rotation matrix is given as:

$$R = \begin{pmatrix}n_{x} & o_{x} & a_{x} \\\ n_{y} & o_{y} & a_{y} \\\ n_{z} & o_{z} & a_{z}\end{pmatrix}$$

## Derivation of Jacobian Matrix

The differential change $dT$ of and transformation of $T$ can be expressed in terms of the differential change of its elements or in terms of a differential translation $d_{x}$**$i$** + $d_{y}$**$j$** + $d_{z}$**$k$** and a differential rotation $\delta_{x}$**$i$** + $\delta_{y}$**$j$** + $\delta_{z}$**$k$** with respect to $T$. The relationship between the two forms is given by:

$$R = \begin{pmatrix}dn_{x} & do_{x} & da_{x} & dp_{x} \\\ n_{y} & o_{y} & a_{y} & dp_{y} \\\ n_{z} & o_{z} & a_{z} & dp_{z} \\\  0 & 0 & 0 & 0\end{pmatrix}$$

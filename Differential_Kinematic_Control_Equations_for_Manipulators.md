# Differential Kinematic Control Equations for Manipulators

In this section, we will discuss a general method for obtaining the Jacobian with differential change in position and orientation as dependent variables and differential change in joint variables as independent variables.

## Coordinate Frame attached to the end-effector

For arm-type robots, the axis of the tool/end-effector is associated with the $z$-axis by convention and is called the **approach vector** and denoted **$\hat{a}$**=($a_{x}, a_{y}, a_{z}$). However, only specifying the direction of the $z$-axis is insufficient to describe the coordinate frame. Thus, one also needs to specify the direction of the $x$- and $y$-axes. The **orientation vector** that provides orientation and is orthogonal to approach vector is defined as **$\hat{o}$**=($o_{x}, o_{y}, o_{z}$). These two unit vectors are sufficient to completely define the rotation matrix since the remaining column can be computed using **$\hat{n}$**=**$\hat{o}$** x **$\hat{a}$** where **$\hat{n}$** is called the **normal vector**. Those three vectors are shown in the picture below.

![alt_tag](https://github.com/colin-zgf/Robotics-Modeling-and-Control/blob/master/image/end_effector.png)

And the corresponding rotation matrix is given as:

$$R = \begin{pmatrix}n_{x} & o_{x} & a_{x} \\\ n_{y} & o_{y} & a_{y} \\\ n_{z} & o_{z} & a_{z}\end{pmatrix}$$

## Derivation of Jacobian Matrix

The differential change $dT$ of and transformation of $T$ can be expressed in terms of the differential change of its elements or in terms of a differential translation $d_{x}$**$i$** + $d_{y}$**$j$** + $d_{z}$**$k$** and a differential rotation $\delta_{x}$**$i$** + $\delta_{y}$**$j$** + $\delta_{z}$**$k$** with respect to $T$. The relationship between the two forms is given by:

$$\begin{align}T + dT = T * (I + \Delta_{T})\end{align}$$

where

$$dT = \begin{pmatrix}dn_{x} & do_{x} & da_{x} & dp_{x} \\\ dn_{y} & do_{y} & da_{y} & dp_{y} \\\ dn_{z} & do_{z} & da_{z} & dp_{z} \\\  0 & 0 & 0 & 0\end{pmatrix}$$

and

$$\Delta_{T} = \begin{pmatrix}0 & -\delta_{z} & \delta_{y} & d_{x} \\\ \delta_{z} & 0 & -\delta_{x} & d_{y} \\\ -\delta_{y} & \delta_{x} & 0 & d_{z} \\\  0 & 0 & 0 & 0\end{pmatrix}$$

Thus,

$$\begin{align}dT = T * \Delta_{T}\end{align}$$

Assume $T_{N}$ describes the end of the manipulator where N is the number of joints. We will evaluate $\Delta_{TN}$ as a function of changes of joint coordinates, and if $dT_{N}$ is desired then we simply premultiply $\Delta_{TN}$ by $T_{N}$ to obtain $dT_{N}$. If in the case of a manipulator we were to make a change with respect to a link coordinate frame $j - 1$ of $\Delta_{j}$ we could find an equivalent change in $T_{N}$, $\Delta_{TN}$ expressed as

$$\begin{align}T_{N}* \Delta_{TN} = A_{1} * A_{2} * ... * A_{j-1} * \Delta_{j} * A(o \times n)_{j} * ... * A_{N-1} * A_{N}\end{align}$$

Since 

$$\begin{align}T_{N} = A_{1} * A_{2} * ... * A_{j-1} * A_{j} * ... * A_{N-1} * A_{N}\end{align}$$

Thus,

$$\begin{align}\Delta_{TN} = (A_{j} * ... * A_{N-1} * A_{N})^{-1} * \Delta_{j} * (A_{j} * ... * A_{N-1} * A_{N})\end{align}$$

If link $j$ follows a revolute joint then a change of joint coordinate $d\theta_{j}$ corresponds to a rotation about the $z$ axis of the
link $j-1$ coordinate frame since we set the $z$ axis as the revolute axis by convention or:

$$\Delta_{revolute} = \begin{pmatrix}0 & -d_{\theta} & 0 & 0 \\\ d_{\theta} & 0 & 0 & 0 \\\ 0 & 0 & 0 & 0 \\\  0 & 0 & 0 & 0\end{pmatrix}$$

If the link $j$ follows a prismatic joint then the change of joint coordinate $dd_{j}$, corresponds to a translation along the $z$ axis of the link $j-1$ coordinate frame or:

$$\Delta_{revolute} = \begin{pmatrix}0 & 0 & 0 & 0 \\\ 0 & 0 & 0 & 0 \\\ 0 & 0 & 0 & dd \\\  0 & 0 & 0 & 0\end{pmatrix}$$

If we define $U_{j} = (A_{j} * A_{j+1} * ... * A_{N})$ with elements:

$$U_{j} = \begin{pmatrix}n_{x} & o_{x} & a_{x} & p_{x} \\\ n_{y} & o_{y} & a_{y} & p_{y} \\\ n_{z} & o_{z} & a_{z} & p_{z} \\\  0 & 0 & 0 & 1\end{pmatrix}$$

Then,

$$\begin{align}\Delta_{TN} = U_{j}^{-1} * \Delta_{revolute} * U_{j}\end{align}$$

and

$$\Delta_{TN} = \begin{pmatrix}0 & o_{x}n_{y}-o_{y}n_{x} & a_{x}n_{y}-a_{y}n_{x} & p_{x}n_{y}-p_{y}n_{x} \\\ n_{x}o_{y} -n_{y}o_{x} & 0 & a_{x}o_{y}-a_{y}o_{x} & p_{x}o_{y}-p_{y}o_{x} \\\ n_{x}a_{y}-n_{y}a_{x} & o_{x}a_{y}-o_{y}a_{x} & 0 & p_{x}a_{y}-p_{y}a_{x} \\\  0 & 0 & 0 & 0\end{pmatrix}$$

Treating **$n$**, **$o$**, and **$a$** as vectors we can rewrite this in terms of the vector cross product:

$$\Delta_{TN} = \begin{bmatrix}0 & -a_{z} & o_{z} & p_{x}n_{y} - n_{x}p_{y} \\\ a_{z} & 0 & -n_{z} & p_{x}o_{y} - o_{x}p_{y}  \\\ -o_{z} & n_{z} & 0 & p_{x}a_{y} - a_{x}p_{y} \\\  0 & 0 & 0 & 0\end{bmatrix}d\theta_{j}$$

In the case of a prismatic joint,

$$\begin{align}\Delta_{TN} = U_{j}^{-1} * \Delta_{prismatic} * U_{j}\end{align}$$

and

$$\Delta_{TN} = \begin{bmatrix}0 & 0 & 0 & n_{z} \\\ 0 & 0 & 0 & o_{z}  \\\ 0 & 0 & 0 & a_{z} \\\  0 & 0 & 0 & 0\end{bmatrix}dd_{j}$$

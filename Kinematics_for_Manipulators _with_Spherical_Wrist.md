# Kinematics for Manipulators with Spherical_Wrist

The kinematics calculation is based on the homogeneous transformation representation. Of the 16 elements of the homogeneous transformation, only 9 need to be stored if only rotation and translation are to be represented, as the fourth row consists of three zeros and a one, and the first column can be retrieved as the vector cross product of the second and third columns.

## Inverse of Homogeneous Transformation Matrix

Given a transformation matrix:

$$A = \begin{bmatrix}n_{x} & o_{x} & a_{x} & p_{x} \\\ n_{y} & o_{y} & a_{y} & p_{y} \\\ n_{z} & o_{z} & a_{z} & p_{z} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{1}$$

The corresponding inverse $A^{-1}$ is given by:

$$A^{-1} = \begin{bmatrix}n_{x} & n_{y} & n_{z} & -p \cdot n \\\ o_{x} & o_{y} & o_{z} & -p \cdot o \\\ a_{x} & a_{y} & a_{z} & -p \cdot a \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{2}$$

This can be easily verified through augmented matrix:

### **Proof:**

$$\begin{bmatrix} R_{3 \times 3} & p & I_{3 \times 3} & 0 \\\ 0_{3 \times 3} & 1 & 0_{3 \times 3} & 1\end{bmatrix}\tag{3}$$

Multiplying $R^{-1}$ on the first row leads to

$$\begin{bmatrix} I_{3 \times 3} & R^{-1}p & R^{-1} & 0 \\\ 0_{3 \times 3} & 1 & 0_{3 \times 3} & 1\end{bmatrix}\tag{4}$$

Multiplying $-R^{-1}p$ on the second row and adding it to the first row gives

$$\begin{bmatrix} I_{3 \times 3} & 0 & R^{-1} & -R^{-1}p \\\ 0_{3 \times 3} & 1 & 0_{3 \times 3} & 1\end{bmatrix}\tag{5}$$

Thus, the inverse $A^{-1}$ is

$$\begin{bmatrix}R^{-1} & -R^{-1}p \\\ 0_{3 \times 3} & 1\end{bmatrix}\tag{6}$$

Since $R^{-1} = R^{T}$, the product $-R^{-1}p$ is just

$$\begin{bmatrix}-p \cdot n \\\ -p \cdot o \\\ -p \cdot a\end{bmatrix}\tag{7}$$

## Kinematcis with Spherical Wrist

The homogneous transformation matrix describing position and orientation of the end of a six-degrees-of-freedom manipulator is given by

$$T_{6} = \begin{bmatrix}? & o_{x} & a_{x} & p_{x} \\\ ? & o_{y} & a_{y} & p_{y} \\\ ? & o_{z} & a_{z} & p_{z} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{8}$$

Remember from [forward and inverse kinematcis](https://github.com/colin-zgf/Robotics-Modeling-and-Control/edit/master/Forward_and_Inverse_Kinematics.md), a very important homogenous transformation $A_{i}$ is defined as the product of four basic transformations: rotation about $z$ axis, translation about $z$ axis, rotation around $x$ axis, and translation around $x$ axis.

$$A_{i} = \begin{bmatrix}\cos(\theta_{i}) & -\sin(\theta_{i})\cos(\alpha_{i}) & \sin(\theta_{i})\sin(\alpha_{i}) & a_{i}\cos(\theta_{i}) \\\ 
\sin(\theta_{i}) & \cos(\theta_{i})\cos(\alpha_{i}) & -\cos(\theta_{i})\sin(\alpha_{i}) & a_{i}\sin(\theta_{i}) \\\ 
0 & sin(\alpha_{i}) & cos(\alpha_{i}) & d_{i} \\\ 
0 & 0 & 0 & 1\end{bmatrix}\tag{9}$$ 

The DH table for PUMA560 is shownd in the table below.

Link | $a_{i}$ | $\alpha_{i}$ | $d_{i}$ | $\theta_{i}$
-----| --------|--------------|---------|-----------
1 | 0 | \pi/2 | 0 | $\theta^*_{1}$
2 | $a_{2}$ | 0 | 0 | $\theta^*_{2}$
3 | $a_{3}$ | -\pi/2 | d_{3} | $\theta^*_{3}$
4 | 0 | \pi/2 | d_{4} | $\theta^*_{4}$
5 | 0 | -\pi/2 | 0 | $\theta^*_{5}$
6 | 0 | 0 | 0 | $\theta^*_{6}$

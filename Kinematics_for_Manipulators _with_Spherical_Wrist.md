# Kinematics for Manipulators with Spherical_Wrist

The kinematics calculation is based on the homogeneous transformation representation. Of the 16 elements of the homogeneous transformation, only 9 need to be stored if only rotation and translation are to be represented, as the fourth row consists of three zeros and a one, and the first column can be retrieved as the vector cross product of the second and third columns.

Given a transformation matrix:

$$A = \begin{bmatrix}n_{x} & o_{x} & a_{x} & p_{x} \\\ n_{y} & o_{y} & a_{y} & p_{y} \\\ n_{z} & o_{z} & a_{z} & p_{z} \\\ 0 & 0 & 0 & 1\end{bmatrix}$$

The corresponding inverse $A^{-1}$ is given by:

$$A^{-1} = \begin{bmatrix}n_{x} & n_{y} & n_{z} & -**p \cdot n** \\\ o_{x} & o_{y} & o_{z} & -**p \cdot o** \\\ a_{x} & a_{y} & a_{z} & -**p \cdot a** \\\ 0 & 0 & 0 & 1\end{bmatrix}$$

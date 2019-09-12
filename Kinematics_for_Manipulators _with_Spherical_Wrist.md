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

## Kinematcis with Spherical Wrist (PUMA560)

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
1 | 0 | $\pi /2$ | 0 | $\theta^*_{1}$
2 | $a_{2}$ | 0 | 0 | $\theta^*_{2}$
3 | $a_{3}$ | -$\pi /2$ | $d_{3}$ | $\theta^*_{3}$
4 | 0 | $\pi /2$ | $d_{4}$ | $\theta^*_{4}$
5 | 0 | -$\pi /2$ | 0 | $\theta^*_{5}$
6 | 0 | 0 | 0 | $\theta^*_{6}$

where $*$ means variable.

Based on the DH table, the corresponding $A$ matrices are

$$A_{6} = \begin{bmatrix}C_{6} & -S_{6} & 0 & 0 \\\ S_{6} & C_{6} & 0 & 0 \\\ 0 & 0 & 1 & 0 \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{10}$$

$$A_{5} = \begin{bmatrix}C_{5} & 0 & -S_{5} & 0 \\\ S_{5} & 0 & C_{5} & 0 \\\ 0 & -1 & 0 & 0 \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{11}$$

$$A_{4} = \begin{bmatrix}C_{4} & 0 & S_{4} & 0 \\\ S_{4} & 0 & -C_{4} & 0 \\\ 0 & 1 & 0 & d_{4} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{12}$$

$$A_{3} = \begin{bmatrix}C_{3} & 0 & -S_{3} & a_{3}C_{3} \\\ S_{3} & 0 & C_{3} & a_{3}S_{3} \\\ 0 & -1 & 0 & d_{3} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{13}$$

$$A_{2} = \begin{bmatrix}C_{2} & -S_{2} & 0 & a_{2}C_{2} \\\ S_{2} & C_{2} & 0 & a_{2}S_{2} \\\ 0 & 0 & 1 & 0 \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{14}$$

$$A_{1} = \begin{bmatrix}C_{1} & 0 & S_{1} & 0 \\\ S_{1} & 0 & -C_{1} & 0 \\\ 0 & 1 & 0 & 0 \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{15}$$

where $S_{i}=\sin (\theta_{i}), C_{i}=\cos (\theta_{i})$.

As joints 2 and 3 are parallel and the matrix product of $A_{2}$ and $A_{3}$ involves sines and cosines of the sum of $\theta_{2}$ and $\theta_{3}$, we will replace $A_{2}$ and $A_{3}$ with the product $A_{23}$ before multiplying the matrices to obtain $A_{6}$.

$$A_{23} = \begin{bmatrix}C_{23} & 0 & -S_{23} & a_{3}C_{23}+a_{2}C_{2} \\\ S_{23} & 0 & C_{23} & a_{3}S_{23}+a_{2}S_{2} \\\ 0 & -1 & 0 & d_{3} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{16}$$

where $S_{23}=\sin (\theta_{2} + \theta_{3}), C_{23}=\cos (\theta_{2} + \theta_{3})$.

## Position and Orientation of the Manipulator

$T_{6}$ can be expressed as the product of $A_{1}$, $A_{23}$, $A_{4}$, $A_{5}$, and $A_{6}$, namly,

$$T_{6} = A_{1}A_{23}A_{4}A_{5}A_{6}\tag{17}$$

We will evaluate this matrix from right to left, making use of intermediate product matrices $U_{i}$, which we will also need for the solution and the computation of the Jacobian, as follows:

$$U_{6} = A_{6} \\\ U_{5} = A_{5}U_{6} \\\ U_{4} = A_{4}U_{5} \\\ U_{3} = A_{3}U_{4} \\\ U_{2} = A_{23}U_{4} \\\ U_{1} = A_{1}U_{2}\tag{18}$$

The identifiers of these variables will be of the form $U_{ijk}$, where $i$ refers to the $i$th $U$ matrix and $j$ and $k$ refer to the $j$th row and $k$th column of $U_{i}$. Then,

$$U_{6} = A_{6} = \begin{bmatrix}C_{6} & -S_{6} & 0 & 0 \\\ S_{6} & C_{6} & 0 & 0 \\\ 0 & 0 & 1 & 0 \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{19}$$

$$U_{5} = \begin{bmatrix}C_{5}C_{6} & -C_{5}S_{6} & -S_{5} & 0 \\\ S_{5}C_{6} & -S_{5}S_{6} & C_{5} & 0 \\\ -S_{6} & -C_{6} & 0 & 0 \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{20}$$

where

$$U_{511} = C_{5}C_{6} \\\ U_{512} = -C_{5}S_{6} \\\ U_{521} = S_{5}C_{6} \\\ U_{522} = -S_{5}S_{6}\tag{21}$$

$$U_{4} = \begin{bmatrix}C_{4}U_{511} - S_{4}S_{6} & C_{4}U_{512}-S_{4}C_{6} & -C_{4}S_{5} & 0 \\\ S_{4}U_{511}+C_{4}S_{6} & S_{4}U_{512} + C_{4}C_{6} & -S_{4}S_{5} & 0 \\\ U_{521} & U_{522} & C_{5} & d_{4} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{22}$$

where

$$U_{411} = C_{4}U_{511} - S_{4}S_{6} \\\ U_{412} = C_{4}U_{512} - S_{4}C_{6} \\\ U_{413} = -C_{4}S_{5} \\\ U_{421} = S_{4}U_{511} + C_{4}S_{6} \\\ U_{422} = S_{4}U_{512} + C_{4}C_{6} \\\ U_{423} = -S_{4}S_{5}\tag{23}$$

$$U_{3} = \begin{bmatrix}C_{3}U_{411} - S_{3}U_{521} & C_{3}U_{412}-S_{3}U_{522} & C_{3}U_{413} - S_{3}C_{5} & -S_{3}d_{4} + C_{3}a_{3} \\\ S_{3}U_{411}+C_{3}U_{521} & S_{3}U_{412} + C_{3}U_{522} & S_{3}U_{413} + C_{3}C_{5} & C_{3}d_{4} + S_{3}a_{3} \\\ -U_{421} & -U_{422} & -U_{423} & d_{3} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{24}$$

where

$$U_{311} = C_{3}U_{411} - S_{3}U_{521} \\\ U_{312} = C_{3}U_{412} - S_{3}U_{522} \\\ U_{313} = C_{3}U_{413} - S_{3}C_{5} \\\ U_{314} = -S_{3}d_{4} + C_{3}a_{3} \\\ U_{321} = S_{3}U_{411} + C_{3}U_{521} \\\ U_{322} = S_{3}U_{412} + C_{3}U_{522} \\\ U_{323} = S_{3}U_{413} + C_{3}C_{5} \\\ U_{324} = C_{3}d_{4} + S_{3}a_{3}\tag{25}$$

$$U_{2} = \begin{bmatrix}C_{23}U_{411} - S_{23}U_{521} & C_{23}U_{412}-S_{23}U_{522} & C_{23}U_{413} - S_{23}C_{5} & -S_{23}d_{4} + C_{23}a_{3} + C_{2}a_{2} \\\ S_{23}U_{411}+C_{23}U_{521} & S_{23}U_{412} + C_{23}U_{522} & S_{23}U_{413} + C_{23}C_{5} & C_{23}d_{4} + S_{23}a_{3} + S_{2}a_{2} \\\ -U_{421} & -U_{422} & -U_{423} & d_{3} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{26}$$

where

$$U_{211} = C_{23}U_{411} - S_{23}U_{521} \\\ U_{212} = C_{23}U_{412} - S_{23}U_{522} \\\ U_{213} = C_{23}U_{413} - S_{23}C_{5} \\\ U_{214} = -S_{23}d_{4} + C_{23}a_{3} + C_{2}a_{2} \\\ U_{221} = S_{23}U_{411} + C_{23}U_{521} \\\ U_{222} = S_{23}U_{412} + C_{23}U_{522} \\\ U_{223} = S_{23}U_{413} + C_{23}C_{5} \\\ U_{224} = C_{23}d_{4} + S_{23}a_{3} + S_{2}a_{2}\tag{27}$$

$$U_{1} = \begin{bmatrix}? & C_{1}U_{212}-S_{1}U_{422} & C_{1}U_{213} - S_{1}U_{423} & C_{1}U_{214} + S_{1}d_{3} \\\ ? & S_{1}U_{212} + C_{1}U_{422} & S_{1}U_{213} + C_{1}U_{423} & S_{1}U_{214} - C_{1}d_{3} \\\ ? & U_{222} & U_{223} & U_{224} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{28}$$

As the elements of $T_{6}$ are numeric values, each column can be represented by a general column

$$\begin{bmatrix}x & y & z & w\end{bmatrix}^{T}\tag{29}$$

where $x$, $y$, and $z$ represent the numeric values of the components of the **$n$, $o$, $a$** and **$p$** vectors if the first, second, third, or fourth columns are specified respectively. If one of the first three columns is specified, then $w$ = 0; otherwise, $w$ = 1. We shall refer to the elements of the $V_{i}$ matrices by three subscripts $V_{ijk}$, where $i$ refers to the $i$th $V$ matrix (as in the case of the $U_{i}$ matrices). The second two subscripts, $jk$, refer to the $j$th row and $k$th column of the particular matrix. We set:

$$T_{6} = V_{0} = U_{1} \\\ A_{1}^{-1}T_{6} = V_{1} = U_{2} \\\ A_{2}^{-1}V_{1} = V_{2} = U_{3} \\\ A_{23}^{-1}V_{1} = V_{3} = U_{4} \\\ A_{4}^{-1}V_{3} = V_{4} = U_{5} \\\ A_{5}^{-1}V_{4} = V_{5} = U_{6}\tag{30}$$

The solution is obtained by solving these matrix equations in order. The first equation is solved for $\theta_{1}$, the second equation is solved for $\theta_{2}$, and so on until the final equation is solved for $\theta_{6}$, If the equations are solved in this order, the left-hand sides are always defined. The elements of the matrix of the right-hand side, the $U$ matrices, reveal the functional dependence of the joint coordinate directly. 

We must first evaluate the elements of the $V_{i}$ transformations starting with $V_{0}$, which is given as

$$V_{0j} = \begin{bmatrix}x & y & z & w\end{bmatrix}^{T}\tag{31}$$

where $V_{0jk}$ are obtained by substituting the components of the **$n$, $o$, $a$**, and **$p$** for $x$, $y$, and $z$ if $k$ = 1, 2, 3, or 4 respectively and substituting 0 for $w$ if $k$ = 1, 2, or 3 and substituting 1 for $w$ if $k$ = 4.

Premultiplying $T_{6}$ by $A_{1}^{-1}$ we obtain $V_{1j}$

$$V_{1j} = \begin{bmatrix}C_{1}x + S_{1}y \\\ z \\\ S_{1}x - C_{1}y \\\ w\end{bmatrix}\tag{32}$$

Then premultiplying $V_{1j}$ by $A_{2}^{-1}$ we obtain $V_{2j}$

$$V_{2j} = \begin{bmatrix}V_{21} = C_{2}V_{11} + S_{2}z - a_{2}w \\\ V_{22} = -S_{2}V_{11} + C_{2}z \\\ V_{13} &\\\ w\end{bmatrix}\tag{33}$$

Premultiplying $V_{1j}$ by $A_{23}^{-1}$ we obtain $V_{3j}$

$$V_{3j} = \begin{bmatrix}V_{31} = C_{23}V_{11} + S_{23}z - (a_{2}C_{3} + a_{3})w \\\ V_{32} = -V_{13} + d_{3}w \\\ V_{33} = -S_{23}V_{11} + C_{23}z - a_{2}S_{3}w \\\ w\end{bmatrix}\tag{34}$$

Premultiplying $V_{3j}$ by $A_{4}^{-1}$ we obtain $V_{4j}$

$$V_{4j} = \begin{bmatrix}V_{41} = C_{4}V_{31} + S_{4}V_{32} \\\ V_{42} = V_{33} - d_{4}w \\\ V_{43} = S_{4}V_{31} - C_{4}V_{32} \\\ w\end{bmatrix}\tag{35}$$

Finally, premultiplying $V_{4j}$ by $A_{5}^{-1}$ we obtain $V_{5j}$

$$V_{5j} = \begin{bmatrix}V_{51} = C_{5}V_{41} + S_{5}V_{42} \\\ -V_{43} \\\ V_{53} = -S_{5}V_{41} + C_{5}V_{42} &\\\ w\end{bmatrix}\tag{36}$$

The solution is now obtained’by solving the six equations

$$V_{0} = U_{1} \\\ V_{1} = U_{2} \\\ V_{2} = U_{3} \\\ V_{3} = U_{4} \\\ V_{4} = U_{5} \\\ V_{5} = U_{6}\tag{37}$$

- $\theta_{1}$ Calculation

We first equate $V_{0}$ to $U_{1}$:

$$\begin{bmatrix}x \\\ y \\\ z \\\ w\end{bmatrix} = \begin{bmatrix}? & C_{1}U_{212}-S_{1}U_{422} & C_{1}U_{213} - S_{1}U_{423} & C_{1}U_{214} + S_{1}d_{3} \\\ ? & S_{1}U_{212} + C_{1}U_{422} & S_{1}U_{213} + C_{1}U_{423} & S_{1}U_{214} - C_{1}d_{3} \\\ ? & U_{222} & U_{223} & U_{224} \\\ 0 & 0 & 0 & 1\end{bmatrix}\tag{38}$$

The only two possible element equations that we might solve to obtain a solution for $\theta_{1}$ are the (1, 4) and (2, 4) elements. Equating these elements, we obtain

$$p_{x} = C_{1}U_{214} + S_{1}d_{3} \\\ p_{y} = S_{1}U_{214} - C_{1}d_{3}\tag{39}$$

Multiplying the first equation by $S_{1}$, the second by $C_{1}$, and subtracting the second from the first we eliminate $U_{214}$ to obtain

$$S_{1}p_{x} - C_{1}p_{y} = d_{3}\tag{40}$$

Let:

$$r\sin (\phi)=p_{y}, \quad -r\cos (\phi)=p_{x} \quad with \qquad r > 0\tag{41}$$

Then,

$$r = \sqrt{p_{x}^{2} + p_{y}^{2}} \quad and \quad \phi = tan^{-1}\frac{p_{y}}{p_{x}}\tag{42}$$

Based on Eqn. (40), we obtain

$$r\sin (\theta_{1} - \phi)= \frac{d_{3}}{r}\tag{43}$$

and

$$\theta_{1} = tan^{-1}\frac{p_{y}}{p_{x}} + sin^{-1}\frac{d_{3}}{r}\tag{44}$$

The $sin^{-1}$ function is double valued so that a second solution exists for $\theta_{1}$:

$$\theta_{1} = tan^{-1}\frac{p_{y}}{p_{x}} + \pi - sin^{-1}\frac{d_{3}}{r}\tag{45}$$

### $\theta_{2}$ Calculation

### $\theta_{3}$ Calculation

### $\theta_{4}$ Calculation

### $\theta_{5}$ Calculation

### $\theta_{6}$ Calculation

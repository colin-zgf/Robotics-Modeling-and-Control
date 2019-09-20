# Jacobian in Velocity Kinematics

The relationship between velocity and joint velocity $\dot{q}(t)=(q_{1}, q_{2}, ..., q_{N})^{T}$ where N is the number of joints is given by:

$$\begin{bmatrix}v_{N}^{0} \\\ \omega_{N}^{0} \end{bmatrix} = \begin{bmatrix}J_{v} \\\ J_{\omega} \end{bmatrix}\dot{q}\tag{1}$$

where

$$J_{v}=(J_{v_{1}}, J_{v_{2}},...,J_{v_{N}})$$

$$J_{\omega}=(J_{\omega_{1}}, J_{\omega_{2}},...,J_{\omega_{N}})$$

Basically, there are two ways for the Jacobian matrix representation. Here only show the final Jacobian format witout the derivation.

## Method 1

The $i$th column of $J_{v_{i}}$ is

$$J_{v_{i}}=
\begin{cases}
z_{i-1} \times (o_{N} - o_{i-1})& \text{for revolute joint i}\\\ 
z_{i-1}& \text{for prismatic joint i}
\end{cases}\tag{2}$$

The $i$th column of $J_{\omega_{i}}$ is

$$J_{\omega_{i}}=
\begin{cases}
z_{i-1}& \text{for revolute joint i}\\\ 
0& \text{for prismatic joint i}
\end{cases}\tag{3}$$

So if $J=(J_{1}, J_{2},...,J_{N})$, then the $i$th column of $J_{i}$ for revolute joint is given by

$$J_{i}=
\begin{cases}
z_{i-1} \times (o_{N} - o_{i-1})\\\ z_{i-1}\end{cases}\tag{4}$$

and the $i$th column of $J_{i}$ for prismatic joint is given by

$$J_{\omega_{i}}=
\begin{cases}
z_{i-1}\\\ 0\end{cases}\tag{5}$$

## Method 2

If we define $U_{j} = (A_{j} * A_{j+1} * ... * A_{N})$ with elements:

$$U_{j} = \begin{pmatrix}n_{x} & o_{x} & a_{x} & p_{x} \\\ n_{y} & o_{y} & a_{y} & p_{y} \\\ n_{z} & o_{z} & a_{z} & p_{z} \\\  0 & 0 & 0 & 1\end{pmatrix}\tag{6}$$

Therefore, the Jacobian Matrix $J_{6\times N}$ consists of $N$ columns of the form bewlow where $N$ is the number of joint:

For revolute, each column is the form of:

$$\begin{bmatrix}p_{x}n_{y} - n_{x}p_{y} \\\ p_{x}o_{y} - o_{x}p_{y} \\\ p_{x}a_{y} - a_{x}p_{y} \\\  n_{z} \\\ o_{z} \\\ a_{z}\end{bmatrix}\tag{7}$$

For prismatic, each column is the form of:

$$\begin{bmatrix}n_{z} \\\ o_{z} \\\ a_{z} \\\  0 \\\ 0 \\\ 0\end{bmatrix}\tag{8}$$

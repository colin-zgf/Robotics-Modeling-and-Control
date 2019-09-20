# Jacobian in Velocity Kinematics

The relationship between velocity and joint velocity $\dot{q}(t)=(q_{1}, q_{2}, ..., q_{n})^{T}$ where n is the number of joints is given by:

$$\begin{bmatrix}v_{n}^{0} \\\ \omega_{n}^{0} \end{bmatrix} = \begin{bmatrix}J_{v} \\\ J_{\omega} \end{bmatrix}\dot{q}\tag{1}$$

where

$$J_{v}=(J_{v_{1}}, J_{v_{2}},...,J_{v_{n}})$$

$$J_{\omega}=(J_{\omega_{1}}, J_{\omega_{2}},...,J_{\omega_{n}})$$

Basically, there are two ways for the Jacobian matrix representation. Here only show the final Jacobian format witout the derivation.

## Method 1

The $i$th column of $J_{v_{i}}$ is

$$J_{v_{i}}=
\begin{cases}
z_{i-1} \times (o_{n} - o_{i-1})& \text{for revolute joint i}\\\ 
z_{i-1}& \text{for prismatic joint i}
\end{cases}\tag{2}$$

The $i$th column of $J_{\omega_{i}}$ is

$$J_{\omega_{i}}=
\begin{cases}
z_{i-1}& \text{for revolute joint i}\\\ 
0& \text{for prismatic joint i}
\end{cases}\tag{3}$$

So if $$J=(J_{1}, J_{2},...,J_{n})$$, then the $i$th column of $J_{i}$ for revolute joint is given by

$$J_{i}=
\begin{cases}
z_{i-1} \times (o_{n} - o_{i-1})\\\ z_{i-1}\end{cases}\tag{4}$$

and the $i$th column of $J_{i}$ for prismatic joint is given by

$$J_{\omega_{i}}=
\begin{cases}
z_{i-1}\\\ 0\end{cases}\tag{5}$$

# Jacobian Matrix between Coordinates

The Jacobian matrix between coordinates can be divided into two cases.

## Case 1

The spatial velocity of a point with respect to frame **$A$** can be expressed relative to frame **$B$** through

$$J_{A}^{B} = \begin{bmatrix}R_{A}^{B} & 0_{3\times 3} \\\ 0_{3\times 3} & R_{A}^{B}\end{bmatrix}\tag{1}$$

where $R_{A}^{B}$ is the rotation matrix from $A$ to $B$.

## Case 2

The case where we know the velocity of the origin of frame **$A$** attached to a rigid body, and we want to determine the velocity of the origin of frame **$B$** attached to the same body with some translation. Then the Jacobian matrix is given by

$$J_{A}^{B} = \begin{bmatrix}R_{A}^{B} & -R_{A}^{B}S(t_{B}^{A}) \\\ 0_{3\times 3} & R_{A}^{B}\end{bmatrix}\tag{2}$$

where $t_{B}^{A}$ is the translation from $B$ to $A$.

### Proof:

Assume a point $p^{A}$ in frame **$A$** with some translation $t$, then the point in frame **$B$** can be written as

$$p^{B}=R_{A}^{B}p^{A} + t_{A}^{B}\tag{3}$$

The corresponding velocy is

$$\dot{p^{B}}=\dot{R_{A}^{B}}p^{A} + \dot{t_{A}^{B}} = S(\omega_{A}^{B})R_{A}^{B}p^{A} + v_{A}^{B} = \omega_{A}^{B} \times p^{B} + v_{A}^{B}\tag{4}$$

where $v_{A}^{B}$ is the velocity of translation derivative term $\dot{t_{A}^{B}}$.

Since, $\omega_{A}^{B} \times p^{B} = - p^{B} \times \omega_{A}^{B} = -S(p^{B})\omega_{A}^{B}$. Thus,

$$\dot{p^{B}}=-S(p^{B})\omega_{A}^{B} + v_{A}^{B}\tag{5}$$

It is easy to see that:

$$S(p^{A}) = S((R_{A}^{B})^{T}p^{B}) = (R_{A}^{B})^{T}S(p^{B})R_{A}^{B}\tag{6}$$

Based on this,

$$\dot{p^{B}}=-R_{A}^{B}S(p^{A})(R_{A}^{B})^{T}\omega_{A}^{B} + R_{A}^{B}v_{A}\tag{7}$$

$$\dot{p^{B}}=-R_{A}^{B}S(p^{A})R_{B}^{A}\omega_{A}^{B} + R_{A}^{B}v_{A}\tag{8}$$

$$\dot{p^{B}}=-R_{A}^{B}S(p^{A})\omega_{A} + R_{A}^{B}v_{A}\tag{9}$$

Namely,

$$v^{B}=-R_{A}^{B}S(p^{A})\omega_{A} + R_{A}^{B}v_{A}\tag{9}$$

In sum, if the forward homogeneous transformation matrix which can be calculated through forward kinematics is given by:

$$T_{B}^{A} = \begin{bmatrix}R_{B}^{A} & t_{B}^{A} \\\ 0_{3\times 3} & 1\end{bmatrix}\tag{10}$$

Then, the Jacobian matrix $J_{A}^{B}$ is

$$J_{A}^{B} = \begin{bmatrix}R_{A}^{B} & -R_{A}^{B}S(t_{B}^{A}) \\\ 0_{3\times 3} & R_{A}^{B}\end{bmatrix}\tag{11}$$

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

$$p^{B}=R_{A}^{B}p^{A} + t_{B}^{A}\tag{3}$$

The corresponding velocy is

$$\dot{p^{B}}=\dot{R_{A}^{B}}p^{A} + \dot{t_{B}^{A}} = S(\omega_{A}^{B})R_{A}^{B}p^{A} = \omega_{A}^{B} \times p^{A} + v_{A}^{B}\tag{4}$$

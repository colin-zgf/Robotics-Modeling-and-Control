# Recursive Newton-Euler Algorithm for Dynamics

Basicially, there are two methods for the dynamics calculation of robot manipulators: Euler-Lagrange Equations and Newton-Euler formulation. The latter is usually preferred since it has $O(N)$ complexity while the former has $O(N^{3})$ complexity where $N$ is the axis number of manipulator.

In this section, the Newton-Euler formulation will be derived.

## Relationship between angular velocity and torque

The corresponding teminology is defined as below:

$\omega_{0}$--angular velocity with respect to inertial frame

$R$--rotation matrix from that transforms coordinates from the body attached frame to the inertial frame

$\tau$--torque

It is well known that 

$$\omega_{0} = R\omega, \quad \omega=R^{T}\omega_{0}\tag{1}$$

Hence, the angular momentum, expressed in the inertial frame, is

$$h = RIR^{T}R\omega=RI\omega\tag{2}$$

Differentiating the formula above given $I$ is constant leads to

$$\dot{h} = \dot{R}I\omega + RI\dot{\omega}\tag{3}$$

Now,

$$S(\omega_{0}) = \dot{R}R^{T}, \quad \dot{R}=S(\omega_{0})R\tag{4}$$

Combining Eqn.(3) and Eqn.(4) results in:

$$\dot{h} = S(\omega_{0})RI\omega + RI\dot{\omega}\tag{5}$$

With respect to the frame rigidly attached to the body, the rate of change of the angular momentum is

$$R^{T}\dot{h} = R^{T}S(\omega_{0})RI\omega + I\dot{\omega} \\\
                = S(R^{T}\omega_{0})I\omega + I\dot{\omega} \\\
                = S(\omega)I\omega + I\dot{\omega} \\\
                = \omega \times (I\omega) + I\dot{\omega} \\\
                = \tau\tag{6}$$

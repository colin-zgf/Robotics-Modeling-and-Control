# Recursive Newton-Euler Algorithm for Dynamics

Basicially, there are two methods for the dynamics calculation of robot manipulators: Euler-Lagrange Equations and Newton-Euler formulation. The latter is usually preferred since it has $O(N)$ complexity while the former has $O(N^{3})$ complexity where $N$ is the axis number of manipulator.

In this section, the Newton-Euler formulation will be derived.

## Relationship between angular velocity and torque

The corresponding teminology is defined as below:

$\omega_{0}$--angular velocity with respect to inertial frame

$R$--rotation matrix from that transforms coordinates from the body attached frame to the inertial frame

$\tau$--torque

It is well known that 

$$\omega_{0} = R\omega\tag{1}$$

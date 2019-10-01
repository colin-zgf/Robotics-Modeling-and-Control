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

$$R^{T}\dot{h} = R^{T}S(\omega_{0})RI\omega + I\dot{\omega} 
               = S(R^{T}\omega_{0})I\omega + I\dot{\omega} 
               = S(\omega)I\omega + I\dot{\omega} 
               = \omega \times (I\omega) + I\dot{\omega} 
               = \tau\tag{6}$$

## Recursive Newton-Eulear

The corresponding teminologies are defined as below:

$a_{c,i}$--the acceleration of the center of mass of link $i$

$a_{e,i}$--the acceleration of the end of of link $i$ (i.e. joint $i$ + 1

$\omega_{i}$-- the angular velocity of frame $i$ w.r.t. frame 0

$\alpha_{i}$--the angular acceleration of frame $i$ w.r.t. frame 0

$g_{i}$--the acceleration due to gravity expressed in frame $i$

$f_{i}$--the force exerted by link $i$-1 on link $i$

$\tau_{i}$--the torque exerted by link $i$-1 on link $i$

$R_{i}^{i+1}$--the rotation matrix from frame $i$ + 1 to frame $i$

$m_{i}$-- the mass of link $i$

$I_{i}$--the inertia matrix of link $i$ about a frame parallel to frame $i$ whose origin is at the center of masss of link $i$

$r_{i,ci}$-- the vector from joint $i$ to the center of mass of link $i$

$r_{i+1, ci}$-- the vector from joint $i$+1 to the center of mass of link $i$

$r_{i,i+1}$-- the vector from joint $i$ to joint $i$ + 1

The force balance equation for link $i$ gives:

$$f_{i}-R_{i}^{i+1}f_{i+1}+m_{i}g_{i} = m_{i}a_{c,i}\tag{7}$$

The momentum balance equation for link $i$ gives:

$$\tau_{i}-R_{i}^{i+1}\tau_{i+1} + f_{i} \times r_{i,ci}-(R_{i}^{i+1}f_{i+1})\times r_{i+1, ci} = I_{i}\alpha_{i} + \omega_{i} \times (I_{i}\omega_{i})\tag{8}$$

Rearrange force and momentum balance equations, we get

$$f_{i} = R_{i}^{i+1}f_{i+1} + m_{i}a_{c,i} -m_{i}g_{i}\tag{9}$$

$$\tau_{i} = R_{i}^{i+1}\tau_{i+1} - f_{i} \times r_{i,ci} + (R_{i}^{i+1}f_{i+1})\times r_{i+1, ci} + I_{i}\alpha_{i} + \omega_{i} \times (I_{i}\omega_{i})\tag{10}$$

**The important term to explain and calculated is the angular velocity term $\omega$**.

We have the relationship

$$\omega_{i}^{0} = \omega_{i-1}^{0} + z_{i-1}^{0}\dot{q_{i}} = (R_{i}^{i-1})^{T}\omega_{i-1} + b_{i}\dot{q_{i}}\tag{11}$$

where

$$b_{i} = (R_{i}^{0})^{T}z_{i-1}$$

It is vitally important to note that

$$\alpha_{i} = (R_{i}^{0})^{T}\dot{\omega_{i}^{0}}\tag{12}$$

$$\dot{\omega_{i}^{0}} = \dot{\omega_{i-1}^{0}} + z_{i-1}\ddot{q_{i}} + \omega_{i-1}^{0} \times z_{i-1}\dot{q_{i}}\tag{13}$$

Expressing the same equation in frame $i$ gives:

$$\alpha_{i} = (R_{i}^{i-1})^{T}\alpha_{i-1} + b_{i}\ddot{q_{i}} + \omega_{i}^{0} \times b_{i}\dot{q_{i}}\tag{14}$$

The velocity of the center of mass of link $i$ is given by

$$v_{c,i}^{0} = v_{e,i-1}^{0} + \omega_{i}^{0}\times r_{i,ci}^{0}\tag{15}$$

Thus, the angular acceleration is shown below:

$$a_{c,i}^{0} = a_{e,i-1}^{0} + \dot{\omega_{i}^{0}} \times r_{i,ci}^{0} + \omega_{i}^{0}\times (\omega_{i}^{0}\times  r_{i,ci}^{0})\tag{16}$$

Based on the fact that

$$a_{c,i} = (R_{i}^{0})^{T}a_{c,i}^{0}\tag{17}$$

We also have to account for the fact that $a_{e,i-1}$ is expressed in frame $i$-1 and transform it to frame $i$, which gives

$$a_{c,i} = (R_{i}^{i-1})^{T}a_{e,i-1} + \dot{\omega_{i}} \times r_{i,ci} + \omega_{i}\times (\omega_{i}\times r_{i,ci})\tag{18}$$

and

$$a_{e,i} = (R_{i}^{i-1})^{T}a_{e,i-1} + \dot{\omega_{i}} \times r_{i,i+1} + \omega_{i}\times (\omega_{i}\times r_{i,i+1})\tag{19}$$

Now the recursive formulation is complete. We can now state the Newton-Euler formulation as follows:

a. Start with the initial conditions

$$\omega_{0} = 0; \alpha_{0}=0; a_{c, 0}=0; a_{e,0}=0$$

and solve Eqn.(11), (12), (19) and (18) (in that order) to compute $\omega_{i}, \alpha_{i}$ and $a_{c,i}$ for $i$ increasing from 1 to $n$.

b. Start with the terminal conditions:

$$f_{n+1}=0; \tau_{n+1}=0$$

and use Eqn.(9) and (10) to compute $f_{i}$ and $\tau_{i}$ for $i$ decreasing from $n$ to 1.

**The key of the whole algorithm is to solve $f_{i}$, $\tau_{i}$ and $a_{e,i}$.**

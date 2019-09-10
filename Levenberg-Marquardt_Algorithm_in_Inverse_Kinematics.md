# Levenberg-Marquardt Algorithm in Inverse Kinematics

The Levenberg-Marquardt Algorithm was developed to solve the non-linear least squares problems. Before introduce the Levenberg-Marquardt Algorithm, we would like to introduce some mathematics in rotation matrix.

## Mathematics in Rotation Matrix

Consider the approximation to the derivative

$$\begin{align}\dot{R} \approx \frac{R_{t+\delta_{t}} - R_{t}}{\delta_{t}}\end{align}$$

which we rearrange as

$$\begin{align}R_{t+\delta_{t}} \approx \delta_{t}\dot{R} +R_{t}\end{align}$$

Combine with 

$$\begin{align}\dot{R_{t}} = S(\omega)R_{t}\end{align}$$

One gets

$$\begin{align}R_{t+\delta_{t}} \approx \delta_{t}S(\omega)R_{t} +R_{t} \approx (\delta_{t}S(\omega)+I_{3\times 3})R_{t}\end{align}$$

The physical meaning of above formula is that the orthnormal rotation matix changes as a function of angular velocity.

Rearranging the above formula leads to

$$\begin{align}\delta_{t}S(\omega) = R_{t+\delta_{t}}R_{t}^{T} - I_{3\times 3}\end{align}$$

$$\begin{align}S(\delta_{t}\omega) = R_{t+\delta_{t}}R_{t}^{T} - I_{3\times 3}\end{align}$$

Thus the angular velocty change during $\delta_{t}$ is 

$$\begin{align}\delta_{\Theta} = vex(R_{t+\delta_{t}}R_{t}^{T} - I_{3\times 3})\end{align}$$

where **vex** represents the inverse function of skey matrix.

If the format of homogenous transformation is given as, 

$$T = \begin{bmatrix}R_{t} & tran_{t} \\\ 0_{3\times 3} & 1 \end{bmatrix}$$

Then, the change during $\delta_{t}$ between two consecutive homogenous transformation can be expressed as

$$delta = \Delta(T_{t}, T_{t+\delta_{t}}) = \begin{bmatrix}tran_{t+\delta_{t}} - tran_{t} \\\ vex(R_{t+\delta_{t}}R_{t}^{T} - I_{3\times 3})\end{bmatrix}$$

## Levenberg-Marquardt Algorithm

Like other numeric minimization algorithms, the Levenberg–Marquardt algorithm is an iterative procedure. To start a minimization in inverse kinematics, one needs to provide the initial joint variable values, e.g. all joint variable values are set to 0. **What we want to calculate is the converged joint variable values once given the end-effector position.** 

Based on Taylor expansion,

$$\begin{align}T_{e} \approx T(q) + J(q)dq \end{align}$$

where $T_e$ mean the transformation matrix corresponding to the end-effector, $T(q)$ is the transformation matrix/prediction during iteration, and $dq$ is the difference of joint variables between two consecutive iterations.

The objective is we want the difference between the end-effector transformation matrix and the predicted transformation matrix to be small enough, namely,

$$\begin{align}objective = argmin_{q} ||\frac{T_{e} - T(q) - J(q)dq}{\sigma}||^2 \end{align}$$ 

$$\begin{align}objective = argmin_{q} |T_{e} - T(q) - J(q)dq|^TW|T_{e} - T(q) - J(q)dq|\end{align}$$ 

$$\begin{align}objective = argmin_{q} |T_{e} - T(q)|^TW|T_{e} - T(q)| - 2|T_{e} - T(q)|^TWJ(q)dq + (dq)^TJ(q)^TWJ(q)dq\end{align}$$

where $W$ is the weighting matrix and is diagonal with $W = 1/\sigma$ when $\sigma$ is set to 1. 

Take the derivative of objective with respect to $dq$ and set to zero:

$$\begin{align}(J(q)^TWJ(q))dq = J(q)^TW|T_{e} - T(q)|\end{align}$$

The Levenberg-Marquardt format is:

$$\begin{align}(J(q)^TWJ(q) + \lambda diag(J(q)^TWJ(q)))dq = J(q)^TW|T_{e} - T(q)|\end{align}$$

Thus, 

$$\begin{align}dq = (J(q)^TWJ(q) + \lambda diag(J(q)^TWJ(q)))^{-1}J(q)^TW|T_{e} - T(q)|\end{align}$$

Now, **what is this delta in the prevous section? It is the term $|T_{e} - T(q)|$ on the right side of the formula abouve:**

After that

$$\begin{align}q_{new} = q_{old} + dq\end{align}$$ 

The process continues until the second norm of $|T_{e} - T(q)|$ is smaller than a cerain threshold.

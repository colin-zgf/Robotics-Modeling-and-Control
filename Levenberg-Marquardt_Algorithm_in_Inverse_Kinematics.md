# Levenberg-Marquardt Algorithm in Inverse Kinematics

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

$$\begin{align}\delta_{t}S(\omega) = R_{t+\delta_{t}}R_{t}^{T} - I_{3\times 3})\end{align}$$

$$\begin{align}S(\delta_{t}\omega) = R_{t+\delta_{t}}R_{t}^{T} - I_{3\times 3})\end{align}$$

Thus the angular velocty change during $\delta_{t}$ is 

$$\begin{align}\delta_{\Theta} = vex(R_{t+\delta_{t}}R_{t}^{T} - I_{3\times 3})\end{align}$$

where **vex** represents the inverse function of skey matrix.

If the format of homogenous transformation is given as, 

$$T = \begin{bmatrix}R_{t} & tran_{t} \\\ 0_{3\times 3} & 1 \end{bmatrix}$$

Then, the change during $\delta_{t}$ can be expressed as

$$delta = \Delta(T_{t}, T_{t+\delta_{t}}) = \begin{bmatrix}tran_{t+\delta_{t}} - tran_{t} \\\ vex(R_{t+\delta_{t}}R_{t}^{T} - I_{3\times 3})\end{bmatrix}$$

Then the difference between two consecutive homogenous transformation is:



The Levenberg-Marquardt Algorithm was developed to solve the non-linear least squares problems. The primary application of the Levenberg–Marquardt algorithm is in the least-squares curve fitting problem: given a set of {\displaystyle m}m empirical datum pairs {\displaystyle \left(x_{i},y_{i}\right)}{\displaystyle \left(x_{i},y_{i}\right)} of independent and dependent variables, find the parameters {\displaystyle {\boldsymbol {\beta }}}{\boldsymbol {\beta }} of the model curve {\displaystyle f\left(x,{\boldsymbol {\beta }}\right)}{\displaystyle f\left(x,{\boldsymbol {\beta }}\right)} so that the sum of the squares of the deviations {\displaystyle S\left({\boldsymbol {\beta }}\right)}{\displaystyle S\left({\boldsymbol {\beta }}\right)} is minimized:


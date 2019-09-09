# Levenberg-Marquardt Algorithm in Inverse Kinematics

## Mathematics in Rotation Matrix

$$\begin{align}\dot{R} \approx \frac{R_{t+\delta_{t}} - R_{t}}{\delta_{t}}\end{align}$$

which we rearrange as

$$\begin{align}R_{t+\delta_{t}} \approx \delta_{t}\dot{R} +R_{t}\end{align}$$

Combine with 

$$\begin{align}\dot{R_{t}} = S(\omega)R_{t}\end{align}$$

One gets

$$\begin{align}R_{t+\delta_{t}} \approx \delta_{t}S(\omega)R_{t} +R_{t} \approx (\delta_{t}S(\omega)+I_{3\times 3})R_{t}\end{align}$$

The physical meaning of above formula is that the orthnormal rotation matix changes as a function of angular velocity.

The Levenberg-Marquardt Algorithm was developed to solve the non-linear least squares problems. The primary application of the Levenberg–Marquardt algorithm is in the least-squares curve fitting problem: given a set of {\displaystyle m}m empirical datum pairs {\displaystyle \left(x_{i},y_{i}\right)}{\displaystyle \left(x_{i},y_{i}\right)} of independent and dependent variables, find the parameters {\displaystyle {\boldsymbol {\beta }}}{\boldsymbol {\beta }} of the model curve {\displaystyle f\left(x,{\boldsymbol {\beta }}\right)}{\displaystyle f\left(x,{\boldsymbol {\beta }}\right)} so that the sum of the squares of the deviations {\displaystyle S\left({\boldsymbol {\beta }}\right)}{\displaystyle S\left({\boldsymbol {\beta }}\right)} is minimized:


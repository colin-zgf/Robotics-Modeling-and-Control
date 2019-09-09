# Levenberg-Marquardt Algorithm in Inverse Kinematics

## Mathematics in Rotation Matrix

$$\begin{align}R\dot = \frac{R<t+\delta_{t}>-R<t>}{\delta_{t}}\end{align}$$

The Levenberg-Marquardt Algorithm was developed to solve the non-linear least squares problems. The primary application of the Levenberg–Marquardt algorithm is in the least-squares curve fitting problem: given a set of {\displaystyle m}m empirical datum pairs {\displaystyle \left(x_{i},y_{i}\right)}{\displaystyle \left(x_{i},y_{i}\right)} of independent and dependent variables, find the parameters {\displaystyle {\boldsymbol {\beta }}}{\boldsymbol {\beta }} of the model curve {\displaystyle f\left(x,{\boldsymbol {\beta }}\right)}{\displaystyle f\left(x,{\boldsymbol {\beta }}\right)} so that the sum of the squares of the deviations {\displaystyle S\left({\boldsymbol {\beta }}\right)}{\displaystyle S\left({\boldsymbol {\beta }}\right)} is minimized:


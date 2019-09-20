clear
close all
clc
mdl_twolink
qn = [1, 1];
L = twolink.links;
U = twolink.tool;
n = twolink.n;
Jn = zeros(6, n);
for j=n:-1:1
    U = L(j).A(qn(j)) * U;
    UT = U.T;
    if L(j).isrevolute
        d = [-UT(1,1)*UT(2,4)+UT(2,1)*UT(1,4)
             -UT(1,2)*UT(2,4)+UT(2,2)*UT(1,4)
             -UT(1,3)*UT(2,4)+UT(2,3)*UT(1,4)];
        delta = UT(3,1:3)';  % nz oz az
    end
    Jn(:,j) = [d; delta];
end
Tn = fkine(twolink, qn);
Rn0 = Tn.R;
Jn0 = [Rn0, zeros(3,3); zeros(3,3), Rn0];
J0 = Jn0 * Jn; % equivalent to 'jacob0(twolink, qn)'
J_plus = inv(J0'* J0) * J0'; % equivalent to 'pin(J0)'
qd = J_plus * [0.1, 0, 0, 0, 0, 0]'; % desired motion is 0.1m/s in the x direction
xd = (J0 * qd)';


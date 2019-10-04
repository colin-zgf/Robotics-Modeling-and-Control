function motion_delta = test_tr2delta(A, B)

if nargin > 0
    fprintf('nargin is %f', nargin)
    if isa(A, 'SE3')
        fprintf('A IS SE3')
        T1 = A.double
    elseif ishomog(A)
        fprintf('A is homogenous')
        T1 = A
    else
        error('SMTB:tr2delta:badarg', 'T1 should be a homogeneous transformation');
    end
    T0 = eye(4,4)
end
if nargin > 1
    fprintf('nargin is %f', nargin)
    T0 = T1
    if isa(B, 'SE3')
        fprintf('B IS SE3')
        T1 = B.double
    elseif ishomog(B)
        fprintf('B is homogenous')
        T1 = B
    else
        error('SMTB:tr2delta:badarg', 'T0 should be a homogeneous transformation');
    end
end
% compute incremental transformation from T0 to T1 in the T0 frame
TD = inv(T0) * T1;

% build the delta vector
motion_delta = [transl(TD); vex(t2r(TD) - eye(3,3))];
end


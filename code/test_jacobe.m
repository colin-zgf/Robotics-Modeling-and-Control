function J = test_jacobe(robot, q, varargin)

    opt.trans = false;
    opt.rot = false;
    opt.deg = false;
    opt = tb_optparse(opt, varargin);
    if opt.deg
        % in degrees mode, scale the columns corresponding to revolute axes
        q = robot.toradians(q);
    end

    n = robot.n;
    L = robot.links;        % get the links


    J = zeros(6, robot.n);
    if isa(q, 'sym')
        J = sym(J);
    end

    U = robot.tool;
    for j=n:-1:1
        if robot.mdh == 0
            fprintf('robot.mdh is 0\n')
            % standard DH convention
            U = L(j).A(q(j)) * U;
        end

        UT = U.T

        if L(j).isrevolute
            fprintf('revolute\n')
            % revolute axis
            d = [   -UT(1,1)*UT(2,4)+UT(2,1)*UT(1,4)
                -UT(1,2)*UT(2,4)+UT(2,2)*UT(1,4)
                -UT(1,3)*UT(2,4)+UT(2,3)*UT(1,4)];
            delta = UT(3,1:3)';  % nz oz az
        else
            % prismatic axis
            d = UT(3,1:3)';      % nz oz az
            delta = zeros(3,1); %  0  0  0
        end
        J(:,j) = [d; delta];

        if robot.mdh ~= 0
            fprintf('robot.mdh is not 0')
            % modified DH convention
            U = L(j).A(q(j)) * U;
        end
    end


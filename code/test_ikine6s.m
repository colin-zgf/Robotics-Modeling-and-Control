function thetavec = test_ikine6s(robot, TT, varargin)
    if robot.mdh ~= 0
        error('RTB:ikine:notsupported','Solution only applicable for standard DH conventions');
    end

    if robot.n ~= 6
        error('RTB:ikine:notsupported','Solution only applicable for 6-axis robot');
    end
    
    TT = SE3(TT);


    L = robot.links;

    if ~robot.isspherical()
        error('RTB:ikine:notsupported', 'wrist is not spherical');
    end
    
    if nargin < 3
        configuration = '';
    else
        configuration = lower(varargin{1});
    end
    
    % default configuration

    sol = [1 1 1];  % left, up, noflip

    for c=configuration
        switch c
            case 'l'
                sol(1) = 1;
            case 'r'
                sol(1) = 2;
            case 'u'
                sol(2) = 1;
            case 'd'
                sol(2) = 2;
            case 'n'
                sol(3) = 1;
            case 'f'
                sol(3) = 2;
        end
    end
    
    % determine the arm structure and the relevant solution to use
    if isempty(robot.ikineType)
        if is_simple(L)
            robot.ikineType = 'nooffset';
        elseif is_puma(L)
            robot.ikineType = 'puma';
        elseif is_offset(L)
            robot.ikineType = 'offset';
        elseif is_rrp(L)
            robot.ikineType = 'rrp';
        else
            error('RTB:ikine6s:badarg', 'This kinematic structure not supported');
        end
    end
    
    for k=1:length(TT)

        % undo base and tool transformations
        T = inv(robot.base) * TT(k) * inv(robot.tool);

        % drop back to matrix form
        T = T.T

        %% now solve for the first 3 joints, based on position of the spherical wrist centre
        
        switch robot.ikineType
            case 'puma'
                a2 = L(2).a;
                a3 = L(3).a;
                d1 = L(1).d;
                d3 = L(3).d;
                d4 = L(4).d;

                % The following parameters are extracted from the Homogeneous
                % Transformation as defined in equation 1, p. 34

                Ox = T(1,2);
                Oy = T(2,2);
                Oz = T(3,2);

                Ax = T(1,3);
                Ay = T(2,3);
                Az = T(3,3);

                Px = T(1,4)
                Py = T(2,4)
                Pz = T(3,4) - d1
    end
    
    thetavec = 0;
end


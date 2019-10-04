function A = transformationMatrix(q_with_offset, d, a, alpha)
A = [cos(q_with_offset), -sin(q_with_offset)*cos(alpha), sin(q_with_offset)*sin(alpha), a*cos(q_with_offset);
    sin(q_with_offset), cos(q_with_offset)*cos(alpha), -cos(q_with_offset)*sin(alpha), a*sin(q_with_offset);
    0, sin(alpha), cos(alpha), d;
    0, 0, 0, 1];
end


% function [p] = solve_for_p(s, n)
    s = [0;1;0];
    c = [1;2;3];
    n = [0.980580675690920;0;-0.196116135138184];
    r = [0;-2.615384615384615;3.200000000000000];
    pxn = [0.512919122669097;3.137858162210944;2.564595613345484];
    syms k l
    p1 = 0
%     p = [p1; p2; p3];
%     S = dual_vec(s, c);
%     N = dual_vec(n, p);

    equation1 = s(1)*k + c(1) == n(1)*l + r(1)
    equation2 = s(2)*k + c(2) == n(2)*l + r(2)
    equation3 = s(3)*k + c(3) == n(3)*l + r(3)
    
    [A, B] = equationsToMatrix([equation1, equation2, equation3], [k, l])
    X = double(linsolve(A, B))
    
    p = [s(1)*X(1) + c(1); s(2)*X(1) + c(2); s(3)*X(1) + c(3)]
    
% end
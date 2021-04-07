function [result] = dual_mult(a, b)
    real_result = a(1) * b(1:3);
    dual_result = a(1) * b(4:6) + a(2) * b(1:3);
    result = [real_result; dual_result];
end
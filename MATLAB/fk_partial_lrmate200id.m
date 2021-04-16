function T = fk_partial_lrmate200id(thetas)

num_theta = size(thetas);
T = eye(4);
for i = 1:num_theta(2)
    if i == 1
        T = T * makeDHmatrix(thetas(i),-pi/2,0.330,0.050);
    elseif i == 2
        T = T * makeDHmatrix(thetas(i)-pi/2,pi,0,0.330);
    elseif i == 3
        T = T * makeDHmatrix(thetas(i),-pi/2,0,0.035);
    elseif i == 4
        T = T * makeDHmatrix(thetas(i),pi/2,-0.335,0);
    elseif i == 5
        T = T * makeDHmatrix(thetas(i),-pi/2,0,0);
    elseif i == 6
        T = T * makeDHmatrix(thetas(i),pi,-0.080,0);
    end
end

end
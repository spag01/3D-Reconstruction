function [M1, M2, K1n, K2n, R1n, R2n, t1n, t2n] = ...
                        rectify_pair(K1, K2, R1, R2, t1, t2)
% RECTIFY_PAIR takes left and right camera paramters (K, R, T) and returns left
%   and right rectification matrices (M1, M2) and updated camera parameters. You
%   can test your function using the provided script q4rectify.m

c1 = -(inv (K1 * R1) )* (K1*t1);
c2 = -(inv (K2 * R2) )* (K2*t2);

difference = c1-c2;
total = sum( (difference).^2);
total = sqrt(total);
r1 = difference/total;
r2 = cross(R1(3,:),r1);
r2 = r2';
r3 = cross(r2,r1);

rotation = [r1 r2 r3]';
temp = K2;

t1n = - rotation * c1;
t2n = - rotation * c2;
M1 = (temp * rotation) * (inv(K1 * R1));
M2 = (temp * rotation) * (inv(K2 * R2));
K1n = temp;
K2n = temp;
R1n = rotation;
R2n = rotation;
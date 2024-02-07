function [K, R, t] = estimate_params(P)
% ESTIMATE_PARAMS computes the intrinsic K, rotation R and translation t from
% given camera matrix P.

[~,~,V] = svd(P);
v = V(:,end);
c = v(1:3,:)/v(4,:);

A = P(1:3,1:3);

P_permute = [0 0 1;
     0 1 0;
     1 0 0];
 
 A_temp = P_permute * A;
 A = transpose(A_temp);

a1 =  A(:,1);
a2 =  A(:,2);
a3 =  A(:,3);

u1 = a1;
e1 = u1/ norm(u1);

u2 = a2 - (dot(a2,e1) * e1);
e2 = u2/ norm(u2);

u3 = a3 - (dot(a3,e1) * e1) - (dot(a3,e2) * e2);
e3 = u3/ norm(u3);

Q_temp = [e1 e2 e3];
R_temp = [dot(a1,e1) dot(a2,e1) dot(a3,e1) ; 
    0 dot(a2,e2) dot(a3,e2) ; 
    0 0 dot(a3,e3)];

Q_permute = P_permute * transpose(Q_temp);
R = P_permute * transpose(R_temp) * P_permute;

K = R;
R = Q_permute;
t = - R * c;
end
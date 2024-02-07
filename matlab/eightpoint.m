function F = eightpoint(pts1, pts2, M)
% eightpoint:
%   pts1 - Nx2 matrix of (x,y) coordinates
%   pts2 - Nx2 matrix of (x,y) coordinates
%   M    - max (imwidth, imheight)

% Q2.1 - Todo:
%     Implement the eightpoint algorithm
%     Generate a matrix F from correspondence '../data/some_corresp.mat'

scale1 = pts1./M;
scale2 = pts2./M;
pts_count = size(pts1,1);

A = ones(pts_count, 9);

for i = 1:pts_count
    x1 = scale1(i,1);
    y1 = scale1(i,2);
    x2 = scale2(i,1);
    y2 = scale2(i,2);

    A(i,:) = [x2*x1,x2*y1, x2, y2*x1, y2*y1, y2, x1, y1, 1];
end

[U,S,V] = svd(A);
F = reshape(V(:,end),3,3);

[U,S,V] = svd(F);
S(3,3) = 0;
F1 = U*S*V';

F_ref = refineF(F1, scale1, scale2);
scaling = [1/M,0,0;0,1/M,0;0,0,1;];

F = scaling' * F_ref * scaling;

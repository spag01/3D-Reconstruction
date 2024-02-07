function P = estimate_pose(x, X)
% ESTIMATE_POSE computes the pose matrix (camera matrix) P given 2D and 3D
% points.
%   Args:
%       x: 2D points with shape [2, N]
%       X: 3D points with shape [3, N]

count = size(x,2);
A = zeros(2 * count,12);
pts2d = x;
pts3d = X;

for i = 1:count
    x = pts3d(1,i);
    y = pts3d(2,i);
    z = pts3d(3,i);
    x_a = pts2d(1,i);
    y_a = pts2d(2,i);
    
    A(2*i-1,:) = -[x, y, z, 1, 0, 0, 0, 0, -x_a * x, -x_a * y, -x_a * z, -x_a];
    A(2*i,:) = -[0, 0, 0, 0, x, y, z, 1, -x * y_a, -y_a * y,-z * y_a, -y_a];
end
[~,~,V] = svd(A);

P = (reshape(V(:,end),4,3))';

end
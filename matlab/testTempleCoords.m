% A test script using templeCoords.mat
%
% Write your code here
%

% Load the two images and the point correspondences from someCorresp.mat

img1 = imread("../data/im1.png");
img2 = imread("../data/im2.png");
someCorresp = load('../data/someCorresp.mat');

pts1 = someCorresp.pts1;
pts2 = someCorresp.pts2;
M = someCorresp.M;

% Run eightpoint to compute the fundamental matrix F
F = eightpoint(pts1, pts2, M);

% Load the points in image 1 contained in templeCoords.mat and run your epipolarCorrespondences on them to get the corresponding points in image 
templeCoords = load('../data/templeCoords.mat');
img1_pts1 = templeCoords.pts1;
img1_pts2 = epipolarCorrespondence(img1, img2, F, img1_pts1);

% Load intrinsics.mat and compute the essential matrix E.
intrinsics = load('../data/intrinsics.mat');
K1 = intrinsics.K1;
K2 = intrinsics.K2;
E = essentialMatrix(F, K1, K2);

% Compute the first camera projection matrix P1 and use camera2.m to compute the four candidates for P2
 temp = eye(3);
 column = [0;0;0];
 temp = [temp column];
 P1 = K1* temp;
 p2 = camera2(E);
 
 d_value = -inf;
 
%  Run your triangulate function using the four sets of camera matrix candidates, the points from templeCoords.mat and their computed correspondences.
for i = 1:4
    P2 = p2(:,:,i);
    pts3d = triangulate(P1, img1_pts1, P2, img1_pts2 );
    if d_value <= sum(pts3d(:,3)>0)
        d_value = sum(pts3d(:,3)>0);
        plot_y = pts3d;
        count = i;
    end
end

% Figure out the correct P2 and the corresponding 3D points and 
% Use matlab’s plot3 function to plot these point correspondences on screen. Please type “axis equal” after “plot3” to scale axes to the same unit.
plot3(plot_y(:, 1), plot_y(:, 3), -plot_y(:, 2), '.'); axis equal

R1 =  eye(3);
t1 = [0;0;0];
R2 = p2(:, 1:3, count);
R2 (1:3,2) = -R2 (1:3,2); 
R2 (1:3,3) = -R2 (1:3,3);
t2 = p2(:, 4, count);

% save extrinsic parameters for dense reconstruction
save('../data/extrinsics.mat', 'R1', 't1', 'R2', 't2');

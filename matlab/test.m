% % Test for 3.1.1 

M = load('../data/someCorresp.mat','M');
pts1_data = load('../data/someCorresp.mat','pts1');
pts2_data = load('../data/someCorresp.mat','pts2');

img1 = imread('../data/im1.png');
img2 = imread('../data/im2.png');
temp = getfield(M,'M');
pts1 = getfield(pts1_data,'pts1');
pts2 = getfield(pts2_data,'pts2');
F = eightpoint(pts1, pts2, temp);
F
% displayEpipolarF(img1, img2, F);

% % Test for 3.1.2

% [coords1, coords2] = epipolarMatchGUI(img1, img2, F);

% % Test for 3.1.3

% M = load('../data/someCorresp.mat','M');
% pts1_data = load('../data/someCorresp.mat','pts1');
% pts2_data = load('../data/someCorresp.mat','pts2');
% K1_data = load('../data/intrinsics.mat','K1');
% K2_data = load('../data/intrinsics.mat','K2');
% img1 = imread('../data/im1.png');
% img2 = imread('../data/im2.png');
% temp = getfield(M,'M');
% pts1 = getfield(pts1_data,'pts1');
% pts2 = getfield(pts2_data,'pts2');
% 
% K1 = getfield(K1_data,'K1');
% K2 = getfield(K2_data,'K2');
% F = eightpoint(pts1, pts2, temp)
% E = essentialMatrix(F, K1, K2)
% 
% scaling = [1/temp 0 0; 0 1/temp 0; 0 0 1];
% E = scaling'*E*scaling

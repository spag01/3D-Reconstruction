function dispM = get_disparity(im1, im2, maxDisp, windowSize)
% GET_DISPARITY creates a disparity map from a pair of rectified images im1 and
%   im2, given the maximum disparity MAXDISP and the window size WINDOWSIZE.

mask = ones(windowSize, windowSize);

distance = zeros(size(im1,1),size(im1,2));

display = zeros(size(im1,1),size(im1,2), maxDisp+1);


for d = 0:maxDisp
    S1 = size(im1,1);
    S2 = size(im1,2);
    
    total = 1: (S1 * (S2 - d));
    
    distance(total) = (im1(total + S1 * d) - im2(total)).^2;
    display(:,:,d+1) = conv2(distance, mask, 'same');   
end

[~, idx] = min(display, [], 3);
dispM = idx - 1;

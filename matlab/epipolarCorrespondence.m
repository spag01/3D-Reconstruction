function [pts2] = epipolarCorrespondence(im1, im2, F, pts1)
% epipolarCorrespondence:
%   Args:
%       im1:    Image 1
%       im2:    Image 2
%       F:      Fundamental Matrix from im1 to im2
%       pts1:   coordinates of points in image 1
%   Returns:
%       pts2:   coordinates of points in image 2
%

count = size(pts1,1);
points = zeros(count,2);

for i = 1:count
    x = pts1(i,1);
    y = pts1(i,2);
    p1 = [x;y;1];
    ep_line = F*p1;
    ep_line = ep_line/-ep_line(2);
    window = 5;
    w1 = double(im1((y - window):(y + window), (x - window):(x + window),:));
    min_dist = inf;

    for j = x-10:x+10
        p2 = [j,ep_line(1)*j + ep_line(3),1];
        x_dash = p2(1);
        y_dash = p2(2);
        w2 = double(im2((y_dash - window):(y_dash + window), (x_dash - window):(x_dash + window),:));
        diff = w1 - w2;
        diff =  diff.^2;
        
        % For three dimensions
        total = sum(diff);
        total = sum(total);
        total = sum(total);
        
        dist = sqrt(total);
        if(dist < min_dist )
            min_dist = dist;
            points(i,1) = p2(1);
            points(i,2) = p2(2);
        end
    end
end
pts2 = points;


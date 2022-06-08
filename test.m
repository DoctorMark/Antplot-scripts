%;*************************************************
%;* Antplot_reciprocal.m
%;* Generates antplot of 1/d
%;*
%;* Mark Agate
%;* (mark.agate@outlook.com)
%;**************************************************

clear;

% Value of which to take the reciprocal (should be odd):
d = 13;

% Ensure d is an odd number
while mod(d, 2) == 0
  d /= 2;
end

% Board extent, initial position and direction
E = 256;
x = 0.5 * E;
y = 0.5 * E;
dir_x = 0;
dir_y = 1;

% Initialise board to grey. (0 = black, 63 = white)
board(1:E, 1:E) = 32;

% Compute 1/d:
r = 1;                      % initialise remainder for 1/d
for n = 1:4                 % do 4 lots of the recurrence pattern

  do                        % repeat until one recurrence is complete
    r *= 2;
    p = (r >= d);           % pixel shade: 0 or 1 (= next bit of quotient)
    r -= p * d;

    % Rotate the ant direction for the next step:
    s = 1 - 2 * (p != (dir_x == 0));	% s = +1 or -1
    tmp = dir_x;
    dir_x = s * dir_y;
    dir_y = s * tmp;

    % If we're still on the board, set the pixel colour
    if (x > 0) & (x <= E) & (y > 0) & (y <= E)
      board(x, y) = !p * 63;
    endif
    
    board(x, y) = !p * 63;

    board(x, y) = !p * 63

    bird(x, y) = !p * 63;
    
    x = !p * 63;
    
    % Move the ant to the next pixel
    x += dir_x;
    y += dir_y;
  until r == 1;

endfor

colormap(gray);
imagesc(board);

%;*************************************************

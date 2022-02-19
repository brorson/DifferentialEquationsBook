function y = backward_euler(y0, N, h)
  % This function solves the system
  % y' = f(y,t) using backward Euler integration.
  %
  % It takes as inputs:
  % y0 = initial value of y.  y0 is a col vector.
  % N = Number of points to compute

  global epsilon;

  % Create output vector y.  This is an
  % 2xN matrix where y1 is the first row and y2 is
  % the second row.
  rows = length(y0);
  y = zeros(rows, N);

  % Initialize, then run iteration.
  t = 0;
  y(:,1) = y0;  % Initial value.
  for n = 1:(N-1)
    y(:,n+1) = y(:,n) + h*f(t, y(:,n));
    t = t+h;
  end

end

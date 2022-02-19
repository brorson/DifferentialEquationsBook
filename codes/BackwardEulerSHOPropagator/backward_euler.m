function y = backward_euler(y0, N, h)
  % This function solves the SHO using the matrix
  % propagator method.
  %
  % It takes as inputs:
  % y0 = initial value of y.  y0 is a col vector.
  % N = Number of points to compute.
  % h = stepsize.

  % Create output vector y.  This is an
  % 2xN matrix where y1 is the first row and y2 is
  % the second row.
  y = zeros(2, N);

  % Initialize, then run iteration.
  A = propagator(h)
  y(:,1) = y0;  % Initial value.
  for n = 1:(N-1)
    y(:,n+1) = A\y(:,n);
  end

end

function y = midpoint(y0, N, h)
  % This function solves the system
  % y' = f(y,t) using the midpoint method.
  %
  % This is the explicit midpoint method.
  %
  % It takes as inputs:
  % y0 = initial value of y.  y0 is a col vector.
  % N = Number of points to compute
  % h = step size.

  % Create output vector y
  rows = length(y0);
  y = zeros(rows, N);

  % Initialize, then run iteration.
  t = 0;
  y(:,1) = y0;  % Initial value.
  for n = 1:(N-1)
    s1 = f(t, y(:,n));                % Slope at current location.
    ytilde = y(:,n) + (h/2)*s1;       % Forward Euler step.
    s2 = f(t, ytilde);                % Slope at new t, ytilde
    y(:,n+1) = y(:,n) + h*s2;  % Midpoint step
    t = t+h;
  end

end

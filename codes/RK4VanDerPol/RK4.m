function y = RK4(y0, N, h)
  % This function solves the system
  % y' = f(y,t) using 4th order Runge-Kutta
  %
  % It takes as inputs:
  % y0 = initial value of y.  y0 is a col vector.
  % N = Number of points to compute

  % create vector y
  rows = length(y0);
  y = zeros(rows, N);

  % This implementation is vectorized so it works for
  % any system of 1st order ODEs.  The system itself
  % is defined in the file f.m.
  t = 0;
  y(:,1) = y0;
  for n = 1:(N-1)
    k1 = h*f(t, y(:,n));
    k2 = h*f(t+h/2, y(:,n) + k1/2);
    k3 = h*f(t+h/2, y(:,n) + k2/2);
    k4 = h*f(t+h, y(:,n) + k3);
    y(:,n+1) = y(:,n) + (k1 + 2*k2 + 2*k3 + k4)/6;
    t = t+h;
  end

end

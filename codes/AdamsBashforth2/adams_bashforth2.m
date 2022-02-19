function y = adams_bashforth2(y0, N, h)
  % This function solves the system
  % y' = f(y,t) using 2nd order Adams Bashforth
  %
  % It takes as inputs:
  % y0 = initial value of y.  y0 is a col vector.
  % N = Number of points to compute

  % Create output vector y
  rows = length(y0);
  y = zeros(rows, N);

  % Initialize first point
  t = 0;
  y(:,1) = y0;  % Initial value.
  
  % Use one step of forward Euler to get the second point
  y(:,2) = y(:,1) + h*f(t, y(:,1));  
  t = t+h;  
  
  % Now step forward using Adams-Bashforth 2nd order
  for n = 1:(N-2)
    y(:,n+2) = h*((3/2)*f(t+h,y(:,n+1)) - (1/2)*f(t,y(:,n))) + y(:,n+1);
    t = t+h;
  end

end

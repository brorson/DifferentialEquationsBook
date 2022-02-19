function y = adams_bashforth3(y0, N, h)
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
  y(:,1) = y0;  % Initial value @ t0
  
  % Need three points to start AB3.  Use a simpler scheme to get
  % intial points.  Can't use forward Euler since it
  % introduces too much error O(h).  Instead, use midpoint method
  % since it is O(h^2).
  % Step 1 -- t1
%  s1 = f(t,y(:,1));        % Slope at beginning of interval
%  yt = y(:,1) + (h/2)*s1;  % Take half step
%  s2 = f(t+h/2,yt);        % Slope at midpoint
%  y(:,2) = y(:,1) + h*s2;  % Take full step
%  t = t+h;
  
  % Step 2 -- t2
%  s1 = f(t,y(:,2));        % Slope at beginning of interval
%  yt = y(:,2) + (h/2)*s1;  % Take half step
%  s2 = f(t+h/2,yt);        % Slope at midpoint
%  y(:,3) = y(:,2) + h*s2;  % Take full step
%  t = t+h;

  y = RK4(y0, 3, h);

  
  % Now step forward using Adams-Bashforth 3nd order.
  % My notes are zero-based, but Matlab indexing is one-based so
  % we compute n=4 here.
  for n = 0:(N-4)
    f2 = (23/12)*f(t*h,y(:,n+3));   
    f1 = -(4/3)*f(t-h,y(:,n+2));
    f0 = (5/12)*f(t-2*h,y(:,n+1));
    y(:,n+4) = h*(f0+f1+f2) + y(:,n+3);
    t = t+h;
  end
  
end

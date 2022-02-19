function y = adams_moulton3(y0, N, h)
  % This function solves the system
  % y' = f(y,t) using 3rd order Adams-Moulton
  %
  % It takes as inputs:
  % y0 = initial value of y.  y0 is a col vector.
  % N = Number of points to compute
  % h = stepsize

  % Turn off annoying messages from fsolve().
  opts = optimset('Diagnostics','off', 'Display','off');

    
  % Create output vector y
  rows = length(y0);
  y = zeros(rows, N);

  % Initialize first point
  t = 0;
  y(:,1) = y0;  % Initial value @ t0
  
  % Now get one additional point to initialize the method.
  y = RK4(y0, 2, h);

  
  % Now step forward using Adams-Moulton 3nd order.
  % My notes are zero-based, but Matlab indexing is one-based so
  % we compute n=3 here.

  % Initialize, then run iteration.
  tn = 0;
  tnp1 = h;
  tnp2 = 2*h;  
  yn = y(:,1);  % Initial value.
  ynp1 = y(:,2);

  for n = 3:N

    % Define the rootfinding problem
    g = @(ynp2) ynp2 - (h/12)*(-f(tn,yn)+8*f(tnp1,ynp1)+5*f(tnp2,ynp2)) - ynp1;
    ynp2 = fsolve(g, ynp1, opts);
    
    % Store this solution value.
    y(:,n) = ynp2;

    % Move solution back and step forward in time
    tn = tnp1;
    tnp1 = tnp2;
    tnp2 = tnp2+h;
    
    yn = ynp1;
    ynp1 = ynp2;

  end
  
end

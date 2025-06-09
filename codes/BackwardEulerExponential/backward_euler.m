function y = backward_euler(y0, N, h)
  % This function solves the system
  % y' = f(y,t) using backward Euler.
  %
  % It takes as inputs:
  % y0 = initial value of y.  y0 is a col vector.
  % N = Number of points to compute
  % h = stepsize.
  % It works by stepping forward in time and
  % at each time point solving the system
  % g(ynp1) = ynp1 - f(tnp1,ynp1) - yn = 0
  % for the variable ynp1.

  % Turn off annoying messages from fsolve().
  opts = optimset('Diagnostics','off', 'Display','off');
    
  % Create output vector y.  Output vector is
  % column vector.
  y = zeros(1, N);

  % Initialize, then run iteration.
  tnp1 = h;
  yn = y0;  % Initial value.
  y(1) = yn;
  for n = 2:N
    % Define the rootfinding problem
    g = @(ynp1) ynp1 - h*f(tnp1,ynp1) - yn;
    ynp1 = fsolve(g,yn, opts);
    % Store this solution value.
    y(n) = ynp1;
    % Move solution back
    yn = ynp1;
    tnp1 = tnp1+h;
  end

end

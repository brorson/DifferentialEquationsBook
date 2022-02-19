function test_heun()
  % This function calls heun with the
  % variables needed to run it.

  global alpha;
  global omega;
  global A;

  % Set up parameters in equation
  alpha = 0.5;
  omega = 5.0;
  A = 1.5;

  % Step size to use
  h = .1;

  % Length of time to compute
  Tmax = 15;

  % Number of points to compute
  N = floor(Tmax/h);

  % Initial condition
  y0 = 1;

  % Time vector -- used in plotting
  t = linspace(0, h*(N-1), N);

  % I only make one plot but I preserve the mechanism to
  % make multiple plots with multiple labels.
  str = [];
  
  % Computed solution using Heun's method.
  y = heun(y0, N, h);
  
  % Create analytic solution
  phi = atan(alpha/omega);
  B = -A/(omega*cos(phi) + alpha*sin(phi));
  C = 1 - B*cos(phi);
  yh = C*exp(-alpha*t);         % Homo. soln.
  yp = B*cos(omega*t + phi);  % Particular soln.
  ya = yh + yp;                 % Total analytic soln

  %  Make plots
  figure(1)
  p = plot(t, y(:),'bo');  % Computed soln
  hold on
  plot(t, ya, 'r');    % Analytic soln

  legend('Computed', 'Analytic', 'Location','NorthEast');
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')

  
end

function test_heun()
  % This function calls heun with the
  % variables needed to run it.

  global k;
  global m;

  % Set up parameters in equation
  k = 11.0;
  m = 0.5;

  % Step sizes to use
  hs = [0.02];

  % Length of time to compute
  Tmax = 5;

  % I only make one plot but I preserve the mechanism to
  % make multiple plots with multiple labels.
  str = {};

  for i=1:length(hs)
    h = hs(i);

    % Number of points to compute
    N = floor(Tmax/h);

    % Initial conditions
    y0 = [1; 0];

    % Time vector -- used in plotting
    t = linspace(0, h*(N-1), N);
  
    % Computed solution using Heun's method
    y = heun(y0, N, h);
  
    %  Make plots
    figure(1)
    plot(t, y(1,:),'o')  
    hold on

    str = horzcat(str,{['h = ' num2str(h)]})

  end

  % Now compute analytic solution and plot it
  omega = sqrt(k/m);
  ya = cos(omega*t);
  plot(t, ya)
  str = horzcat(str,{'analytic'})
  
  % Label figure 1
  legend(str, 'Location','NorthWest')  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')
  
  % Compute difference and plot it
  diff = y(1,:)-ya;
  figure(2)
  plot(t,diff)
  xlabel('t')
  ylabel('ycomputed - yanalytic')
  title('Difference between computed and analytic result')
  
  
end

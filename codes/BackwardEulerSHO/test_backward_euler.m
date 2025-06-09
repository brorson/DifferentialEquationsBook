function test_backward_euler()
  % This function calls backward_euler with the
  % variables needed to run it.

  global k;
  global m;

  % Set up parameters in equation
  k = 11.0;
  m = 0.5;

  % Step sizes to use
  hs = [0.01, .001];

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
  
    % Computed solution using backward Euler
    y = backward_euler(y0, N, h);
  
    %  Make plots
    figure(1)
    plot(t, y(1,:),'o')  
    hold on

    str = horzcat(str,{['h = ' num2str(h)]})

  end
    
  % Label plots
  legend(str, 'Location','NorthWest')  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')
  
end

function test_RK4()
  % This function calls RK4 with the
  % variables needed to run it.

  global g;
  global l;

  % Set up parameters in equation
  g = 9.8;  % m/sec^2
  l = 0.5;  % m

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

    % Initial conditions.  First element is inital angle,
    % second element is initial angular veloc.
    %y0 = [1; 0];  % Use this to get normal swinging.
    y0 = [pi-.02; 0];   % Pendulum bob initial point at top of swing.
                         % The trajectory spends a lot of time hanging
		         % upside-down.
    %y0 = [pi-.02; pi/4];  % Use this to see the pendulum rotate all the way
                         % around the circle.

    % Time vector -- used in plotting
    t = linspace(0, h*N, N);
  
    % Computed solution using RK4
    y = RK4(y0, N, h);
  
    %  Make plots
    figure(1)
    plot(t, y(1,:))  
    hold on

    str = horzcat(str,{['h = ' num2str(h)]});

  end
    
  % Label plots
  legend(str, 'Location','SouthWest')  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')
  
end

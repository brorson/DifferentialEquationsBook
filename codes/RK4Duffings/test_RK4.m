function test_RK4()
  % This function calls RK4 with the
  % variables needed to run it.
 
  global alpha
  global beta
  global delta
  global gamma
  global omega

  % Set up parameters in equation
  delta = .2;
  alpha = 1.1;
  beta = 1.5;
  % Set to 3 for regular motion, set to 35 for chaos.
  gamma = 3; % 35;  
  omega = 1;

  % Step sizes to use
  hs = [0.1, .01, .001];

  % Length of time to compute
  Tmax = 40;

  % I only make one plot but I preserve the mechanism to
  % make multiple plots with multiple labels.
  str = {};

  for i=1:length(hs)
    h = hs(i);

    % Number of points to compute
    N = floor(Tmax/h);

    % Initial condition
    y0 = [-1;-1];
    
    % Time vector -- used in plotting
    t = linspace(0, h*(N-1), N);
  
    % Computed solution using RK4
    y = RK4(y0, N, h);
  
    %  Make plots
    figure(1)
    plot(t, y(1,:))  
    hold on

    str = horzcat(str,{['h = ' num2str(h)]});

  end
    
  % Label plots
  legend(str, 'Location','SouthEast')  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')
  
end

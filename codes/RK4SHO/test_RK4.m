function test_RK4()
  % This function calls RK with the
  % variables needed to run it.

  global k;
  global m;

  % Set up parameters in equation
  k = 11.0;
  m = 0.5;

  omega = sqrt(k/m);  % Oscillation freq
  
  % Step sizes to use
  hs = [0.1, .01];

  % Length of time to compute
  Tmax = 5;

  % I only make one plot but I preserve the mechanism to
  % make multiple plots with multiple labels.
  str = {};
  figure(1)

  for i=1:length(hs)
    h = hs(i);

    % Number of points to compute
    N = floor(Tmax/h);

    % Initial conditions
    y0 = [1; 0];

    % Time vector -- used in plotting
    t = linspace(0, h*(N-1), N);
  
    % Computed solution using RK4
    y = RK4(y0, N, h);

    %  Make plots
    figure(1)
    plot(t, y(1,:), 'o')  
    hold on

    str = horzcat(str,{['h = ' num2str(h)]});

  end

  % Compute analytic (mathematically true) solution.  This
  % is based on last t vector created.
  yt = cos(omega*t);
  plot(t,yt,'b');
  str = horzcat(str,{'Analytic result'});
    
  % Label plots
  figure(1)
  legend(str, 'Location','NorthWest')  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')
  
  
  % Now compute difference between two solutions
  diff = y(1,:)-yt;
  figure(2)
  plot(t,diff)
  xlabel('t')
  ylabel('difference')
  title('Difference between y and yt vs. time')
  
end

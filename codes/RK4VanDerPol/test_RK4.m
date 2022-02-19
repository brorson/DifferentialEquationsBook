function test_RK4()
  % This function calls my naive RK4 with the
  % variables needed to run it.

  global epsilon;

  % Set up parameters in equation
  epsilon = 3.5;

  % Step size to use
  h = .1;

  % Length of time to compute
  Tmax = 15;

  N = floor(Tmax/h);
  
  % I only make one plot but I preserve the mechanism to
  % make multiple plots with multiple labels.
  str = {};

  % Initial cond.
  y0 = [1; 0];

  % Create time axis for plotting
  t = linspace(0, Tmax, N);
  
  % Compute solution
  y = RK4(y0, N, h);
  
  %  Make plot
  figure(1)
  plot(t, y(1,:), 'o')  
  hold on
  
  str = horzcat(str,{['h = ' num2str(h)]});
    
  % Label plots
  legend(str, 'Location','NorthWest')  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')

end

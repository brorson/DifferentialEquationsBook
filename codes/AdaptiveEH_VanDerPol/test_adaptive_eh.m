function test_adaptive_eh()
  % This function calls my naive adaptive solver with the
  % variables needed to run it.

  global epsilon;

  % Set up parameters in equation
  epsilon = 3.5;

  % Length of time to compute
  Tend = 25;

  % Initial cond.
  y0 = [1; 0];

  % Computed solution using adaptive_eh
  [t, y] = adaptive_eh(y0, Tend);
  
  %  Make plot
  figure(1)
  plot(t, y(1,:), 'o')  
  hold on
  
  % Label plots
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')

  % Make phase plot of one cycle
  % t0 = 6.775
  % t1 = 17.075
  idx1 = find(6.775 <= t);  
  idx2 = find(t < 17.075);
  idx = intersect(idx1, idx2);
  z = y(:,idx);
  
  figure(2)
  plot(z(1,:),z(2,:), 'o')
  title('Phase plot')
  
end

function test_ode45()
  % This function calls Matlab's ode45 on the VanDerPol
  % equation.

  global epsilon;

  % Set up parameters in equation
  epsilon = 3.5;

  % Length of time to compute
  Tend = 25;

  % Initial cond.
  y0 = [1, 0];

  % Computed solution using adaptive_eh
  [t, y] = ode45(@f, [0, Tend], y0);
  
  %  Make plot
  figure(1)
  plot(t, y(:,1), 'o')  
  hold on
  
  % Label plots
  xlabel('t')
  ylabel('y')
  title('ODE45 computed solution y vs. time')

  % Make phase plot of one cycle
  t0 = 6.775;
  t1 = 17.075;
  idx1 = find(6.775 <= t);  
  idx2 = find(t < 17.075);
  idx = intersect(idx1, idx2);
  z = y(idx,:);
  
  figure(2)
  plot(z(:,1),z(:,2), 'o')
  title('ODE45 computed phase plot')
  
end

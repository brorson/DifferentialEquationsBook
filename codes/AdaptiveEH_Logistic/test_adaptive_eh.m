function test_adaptive_eh()
  % This function calls the adaptive stepper

  global Ym;

  % Set up parameters in equation
  Ym = 5;

  % Length of time to compute
  Tend = 15;

  % Initial cond.
  y0 = .1;

  % Computed solution using adaptive method
  [t, y] = adaptive_eh(y0, Tend);
  
  % Create analytic solution
  e = y0*exp(t);
  ya = e./(1+e./Ym);
  
  %  Make plots
  figure(1)
  plot(t, y(1,:), 'bo')
  hold on
  xlim([0,Tend])
  plot(t, ya, 'r');    % Analytic soln
  
  % Label plots
  str = {['Ym = ' num2str(Ym)]};
  legend(str, 'Location','NorthWest')  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')
  
end

function test_backward_euler()
  % This function calls backward_euler with the
  % variables needed to run it.

  global Ym;


  % Set up parameters in equation
  Yms = [1, 2.5, 5];

  % Step size to use
  h = .2;

  % Length of time to compute
  Tmax = 15;

  % Number of points to compute
  N = floor(Tmax/h);

  % Initial condition
  y0 = .05;

  % Time vector -- used in plotting
  t = linspace(0, h*(N-1), N);

  % Iterate though different values of Ym
  str = {};
  for i=1:length(Yms)
    Ym = Yms(i);
  
    % Computed solution using forward Euler
    y = backward_euler(y0, N, h);

    % Create analytic solution
    e = y0*exp(t);
    ya = e./(1+e./Ym);
    
    %  Make plots
    figure(1)
    p(i) = plot(t, y(:),'o');
    hold on
    plot(t, ya, 'r')

    str = horzcat(str,{['Ym = ' num2str(Ym)]});
    
  end

  legend(p, str, 'Location','NorthWest');
  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time for different Ym')
  
end

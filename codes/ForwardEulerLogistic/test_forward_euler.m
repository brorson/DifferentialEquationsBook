function test_forward_euler()
  % This function calls ForwardEuler with the
  % variables needed to run it.

  global Ym;

  % Set up parameters in equation
  Yms = [1, 2.5, 5];

  % Step size to use
  h = .2;

  % Length of time to compute
  Tmax = 15;

  % Initial condition
  y0 = 0.05;

  % I only make one plot but I preserve the mechanism to
  % make multiple plots with multiple labels.
  str = [];
  
  for i=1:length(Yms)
    Ym = Yms(i);
  
    % Number of points to compute
    N = floor(Tmax/h);
  
    % Time vector -- used in plotting
    t = linspace(0, h*(N-1), N);

    % Computed solution using forward Euler
    y = forward_euler(y0, N, h);

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
  
  legend(p, str, 'Location','NorthEast');    
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')
  
end

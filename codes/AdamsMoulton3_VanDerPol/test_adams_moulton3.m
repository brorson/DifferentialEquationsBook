function test_adams_moulton3()
  % This function calls adams_moulton3 with the
  % variables needed to run it.
  %

  global epsilon
    
  % Set up parameters in equation
  epsilon = 3.5;

  % Step sizes to use
  hs = [.1, .01];

  % Initial cond.
  y0 = [1; 0];

  % Iterate though different values of alpha
  str = {};
  
  for i=1:length(hs)
    h = hs(i);
  
    % Length of time to compute
    Tmax = 30;
    N = floor(Tmax/h);
  
    % Time vector -- used in plotting
    t = linspace(0, h*(N-1), N);

    % Computed solution using Adams-Moulton 3nd order
    y = adams_moulton3(y0, N, h);

    
    %  Make plots
    figure(1)
    p(i) = plot(t, y(1,:));  % Computed soln
    hold on
    
    str = horzcat(str,{['h = ' num2str(h)]});
  end
  
  legend(p, str, 'Location','NorthWest')  
  
  xlabel('t')
  ylabel('y')

  
end

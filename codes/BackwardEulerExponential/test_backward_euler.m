function test_backward_euler()
  % This function calls backward_euler with the
  % variables needed to run it.

  global alpha;

  % Set up parameters in equation
  alphas = [-0.8, -.1, .1, .8];
  %alphas = [-0.8];  

  % Step size to use
  h = .1;

  % Length of time to compute
  Tmax = 5;

  % Number of points to compute
  N = floor(Tmax/h);

  % Initial condition
  y0 = 1;

  % Time vector -- used in plotting
  t = linspace(0, h*(N-1), N);

  % Iterate though different values of alpha
  str = {};
  for i=1:length(alphas)
    alpha = alphas(i);
  
    % Computed solution using forward Euler
    y = backward_euler(y0, N, h);

    % Create analytic solution
    ya = exp(alpha*t);
    
    %  Make plots
    figure(1)
    p(i) = plot(t, y(:),'o');  % Computed soln
    hold on
    plot(t, ya, 'r');    % Analytic soln

    str = horzcat(str,{['alpha = ' num2str(alpha)]});

    % Compute RMS error
    err = sqrt(dot(y-ya, y-ya)/N);
    fprintf('h = %f, alpha = %f, RMS err = %e\n', h, alpha, err)
    
  end

  legend(p, str, 'Location','NorthWest')  
  
  xlabel('t')
  ylabel('y')
  title('Computed y vs. time for different alphas')
  
end

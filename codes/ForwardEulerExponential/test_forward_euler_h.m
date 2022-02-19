function test_forward_euler_h()
  % This function calls ForwardEuler with the
  % variables needed to run it.
  %
  % This test fcn computes and plots the results for
  % different steps h.  It then makes a plot of err vs. h.

  global alpha;

  % Set up parameters in equation
  alpha = 0.3;

  % Step sizes to use
  hs = [.2, .1, .05, .02, .01, .005, .002, .001];
  %hs = [.2, .05];  

  % Length of time to compute
  Tmax = 5;


  % Iterate though different values of h
  str = {};
  for i=1:length(hs)
    h = hs(i);

    % Number of points to compute
    N = floor(Tmax/h);

    % Initial condition
    y0 = 1;

    % Time vector -- used in plotting
    t = linspace(0, h*(N-1), N);
  
    % Computed solution using forward Euler
    y = forward_euler(y0, N, h);

    % Create analytic solution
    ya = exp(alpha*t);
    
    % Compute RMS error
    err = sqrt(dot(y-ya, y-ya)/N);
    fprintf('h = %f, alpha = %f, RMS err = %e\n', h, alpha, err)
    
    %  Make plots
    figure(1) % Solution plot
    p(i) = plot(t, y(:),'o');  % Computed soln
    hold on
    plot(t, ya, 'r');    % Analytic soln

    figure(2) % Err plot
    q = loglog(h, err, 'o');
    set(q, 'MarkerFaceColor', get(q,'Color'));
    
    hold on

    str = horzcat(str,{['h = ' num2str(h)]});    

  end

  % Must finalize plots by adding labels
  figure(1)
  legend(p, str, 'Location','NorthWest')  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time for different steps h')

  figure(2)
  xlabel('stepsize h')
  ylabel('RMS error')
  legend(str,  'Location','NorthWest')
  title('RMS error vs. stepsize h')
  
end

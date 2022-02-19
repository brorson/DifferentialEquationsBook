function test_symplectic_euler()
  % This function calls ForwardEuler with the
  % variables needed to run it.

  global w;

  % Set up parameters in equation
  k = 11.0;
  m = 0.5;
  w = sqrt(k/m);

  % Step sizes to use
  hs = [0.01, .001];

  % Length of time to compute
  Tmax = 15;

  % I only make one plot but I preserve the mechanism to
  % make multiple plots with multiple labels.
  str = {};

  for i=1:length(hs)
    h = hs(i);
    
    fprintf('h*w = %f\n', h*w)

    % Number of points to compute
    N = floor(Tmax/h);

    % Initial conditions
    y0 = [1; 0];

    % Time vector -- used in plotting
    t = linspace(0, h*(N-1), N);
  
    % Computed solution using symplectic Euler
    y = symplectic_euler(y0, N, h);
  
    %  Make plots
    figure(1)
    plot(t, y(1,:))  
    hold on

    str = horzcat(str,{['h = ' num2str(h)]});

    % Compute magnitude of solution (sin^2 + cos^2)
    z = y(1,:).*y(1,:) + w*w*y(2,:).*y(2,:);
    figure(2)
    plot(t, z)
    hold on
    
    
  end
    
  % Label plots
  figure(1)
  legend(str, 'Location','NorthWest')  
  xlabel('t')
  ylabel('y')
  title('Computed solution y vs. time')

  figure(2)
  ylim([0, 1.1])
  legend(str, 'Location','East')    
  title('Magnitude y1^2 + w^2 y2^2')
  xlabel('t')
  ylabel('Magnitude')
  
   
  figure(3)
  plot(y(1,:),w*y(2,:))
  title('Phase plot')
  
end

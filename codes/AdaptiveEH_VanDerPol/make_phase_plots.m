function make_phase_plots()
  % This function makes a bunch of phase plots of the 
  % Van der Pol system for varying epsilon.

  global epsilon;

  % Set up parameters in equation
  epsilons = 2.5:.3:4;

  % Length of time to compute
  Tend = 25;

  % Initial cond.
  y0 = [1; 0];

  str = {};
  for i=1:length(epsilons)
    epsilon = epsilons(i);
  
    % Computed solution using adaptive_eh
    [t, y] = adaptive_eh(y0, Tend);
  

    % Make phase plot after orbit has settled down
    idx = find(10 <= t);  
    z = y(:,idx);
  
    figure(1)
    p(i) = plot(z(1,:),z(2,:));
    hold on
    
    str = horzcat(str,{['epsilon = ' num2str(epsilon)]});
    
  end
  
  xlabel('y1')
  ylabel('y2')
  legend(p, str, 'Location','NorthWest')
  title('Phase plot')
  
end

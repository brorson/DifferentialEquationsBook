function phase_space_semi_implicit_euler()
  % This shows evolution of square in phase space
  % using symplectic Euler

  global omega
  omega = 1;  % Oscillation freq
    
  % Set up time axis of problem
  Tend = 19;
  deltat = .03;
  N = Tend/deltat;

  % Draw a circle which guides the eye
  t = linspace(0, 2*pi, 100);
  x = cos(t);
  y = sin(t);
  figure(1)
  plot(x, y)
  hold on
  axis([-1.5 1.5 -1.5 1.5])
  axis('square')
  
  % Initial conds
  y1 = [-.02; .98];
  y2 = [-.02; 1.02];
  y3 = [.02; 1.02];
  y4 = [.02; .98];
  
  % Plot initial point
  u = [y1(1), y2(1), y3(1), y4(1), y1(1)];
  v = [y1(2), y2(2), y3(2), y4(2), y1(2)];  
  plot(u, v)
  hold on
  xlabel('u')
  ylabel('v')
  title('Phase space -- Semi-implicit Euler')
  pause(.2)
  
  % Take 10 steps, then plot.
  t = 0;
  while (t<Tend)
    for i = 1:10
      y1 = semi_implicit_euler_step(y1, t, deltat);
      y2 = semi_implicit_euler_step(y2, t, deltat);
      y3 = semi_implicit_euler_step(y3, t, deltat);
      y4 = semi_implicit_euler_step(y4, t, deltat);
      t = t+deltat;
    end
    
    u = [y1(1), y2(1), y3(1), y4(1), y1(1)];
    v = [y1(2), y2(2), y3(2), y4(2), y1(2)];  
    plot(u, v)
    pause(.2)
  end
  

end

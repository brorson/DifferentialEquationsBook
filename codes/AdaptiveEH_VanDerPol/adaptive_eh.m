function [t, y] = adaptive_eh(y0, Tend)
  % This function solves the system
  % y' = f(y,t) using an adaptive method.
  % 
  % The method compute a forward Euler step, then
  % uses it to compute a Heun step.  It uses the
  % Heun step as an oracle to decide whether to increase,
  % decrease, or hold the stepsize h constant.
  %
  % It takes as inputs:
  % y0 = initial value of y.  y0 is a col vector.
  % N = Number of points to compute
  % h = step size.

  % Comparison tol
  tol1 = 1e-1;
  tol2 = 2e-3;  

  % Starting h
  h = .02;
  
  % Initialize, then run iteration.
  tn = 0;
  y(:,1) = y0;  % Initial value.
  t(:,1) = tn;
  % I need to hand-code the loop to check against Tend --
  % because the stepsize is variable, the number of steps
  % taken can change.
  n = 1;
  while (tn < Tend)
  
    fprintf('step n = %d, tn = %f, y = %f, h = %e ... ', n, tn, y(1,n), h)
    
    % First compute trial steps
    s1 = f(tn, y(:,n));             % Slope at current location.
    yfe = y(:,n) + h*s1;           % Forward Euler step.
    s2 = f(tn, yfe);                % Slope at new t
    yh = y(:,n) + h*(s1+s2)/2;     % Heun step.

    % Now compare trials steps 
    diff = norm(yfe-yh);
    fprintf('diff = %e ... ', diff)
    if (diff>tol1)
      % Too much error - shrink step and try again.
      fprintf('Shrink h\n')
      h = h/2;
      continue
    elseif (diff<tol2)
      % Error nice and small -- grow step for next time.
      h = h*2;
      fprintf('Grow h\n')      
    else
      % Error neither large nor small -- keep this step.
      fprintf('Keep h\n')      
    end
    
    % If we get here the computation was good. Store the results.
    n = n+1;
    y(:,n) = yh;
    t(:,n) = tn;
    tn = tn+h;
  end
  
end

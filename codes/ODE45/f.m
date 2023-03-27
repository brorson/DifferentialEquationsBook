function dydt = f(t, y)
  % This returns the value of the function f(t, y)
  % for input t and y.  This is the place where the
  % user defines the system to solve.

  % This returns the van der Pol system.
  % y is a col vector

  global epsilon
  
  dydt = zeros(2,1);

  dydt(1) = y(2);
  dydt(2) = epsilon*(1-y(1).*y(1)).*y(2) - y(1);
  
end


function dydt = f(t, y)
  % This returns the value of the function f(t, y)
  % for input t and y.  This is the place where the
  % user defines the system to solve.

  global g
  global l

  u = y(1);
  v = y(2);
  
  dudt = v;
  dvdt = -(g/l)*sin(u);
  
  dydt = [dudt; dvdt];
  
end


function dydt = f(t, y)
  % This returns the value of the function f(t, y)
  % for input t and y.

  global k
  global m

  u = y(1);
  v = y(2);
  
  dudt = -(k/m)*v;
  dvdt = u;
  
  dydt = [dudt; dvdt];
  
end


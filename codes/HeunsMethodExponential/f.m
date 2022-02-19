function dydt = f(t, y)
  % This returns the value of the function f(t, y)
  % for input t and y.

  global alpha

  dydt = alpha*y;
  
end


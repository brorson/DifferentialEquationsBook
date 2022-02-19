function dydt = f(t, y)
  % This returns the value of the function f(t, y)
  % for input t and y.

  global Ym;

  dydt = (1 - y/Ym)*y;
  
end


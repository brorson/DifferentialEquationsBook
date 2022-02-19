function dydt = f(t, y)
  % This returns the value of the function f(t, y)
  % for input t and y.

  global alpha
  global omega
  global A

  dydt = A*sin(omega*t) - alpha*y;
  
end


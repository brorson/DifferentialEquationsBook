function dydt = f(t, y)
  % This returns the Duffing equation
  % y is a col vector

  global alpha
  global beta
  global delta
  global gamma
  global omega

  dydt = zeros(2,1);

  dydt(1) = y(2);
  dydt(2) = -delta*y(2) - alpha*y(1) - beta*y(1)*y(1)*y(1) + gamma*cos(omega*t);

end


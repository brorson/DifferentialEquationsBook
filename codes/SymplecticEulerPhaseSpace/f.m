function u = f(t, y)

  global omega;

  % Row 1 = pos, row 2 = veloc.
  u1 = y(2);              % Pos update
  v1 = -omega*omega*y(1); % Veloc update

  u = [u1; v1];  % Return should be col vec for ode45.
  
end


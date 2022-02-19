function A = propagator(h)
  % This returns the propagator for forward Euler.

  global k
  global m

  A = [1 -h*k/m; h 1];
end


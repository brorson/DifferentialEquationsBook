function A = propagator(h)
  % This returns the propagator matrix for the SHO.

  global k
  global m

  A = [1 -h*k/m; h 1];
end


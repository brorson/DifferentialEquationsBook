function A = propagator(h)
  % This returns the propagator for symplectic Euler solving
  % the SHO.

  global w

  A = [1-h*h*w*w  -h*w*w;  h  1];
end


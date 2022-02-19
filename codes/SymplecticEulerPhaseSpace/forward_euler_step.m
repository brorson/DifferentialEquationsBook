function ynp1 = forward_euler_step(yn, t, h)
  % This function takes a Forward Euler step starting
  % at position yn.  Stepsize is h.

  % This version works for systems as well as scalar
  % ODEs.
    
  ynp1 = yn + h*f(t, yn);  % Return should be row vec.

end

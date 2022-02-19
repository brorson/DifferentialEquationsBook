function ynp1 = semi_implicit_euler_step(yn, t, h)
  % This function takes a semi-implicit Euler step starting
  % at position yn.  Stepsize is h.

  % This version works for systems as well as scalar
  % ODEs.
    
  global omega
    
  % row 1 = pos, row 2 = veloc.
  un = yn(1);
  vn = yn(2);
  
  % First do veloc.
  vnp1 = vn - h*omega*omega*un;
  
  % Second do pos with updated veloc.
  unp1 = un + h*vnp1;
  
  ynp1 = [unp1, vnp1];  % Return should be row vec.

end

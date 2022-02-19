function plot_g()
  % This just makes a plot of the growth factor g vs.
  % values of h*w.
    
  hw = linspace(-3,3,100);
  
  gp = 1 - (hw.^2/2) + hw.*sqrt(hw.^2-4)/2;
  gm = 1 - (hw.^2/2) - hw.*sqrt(hw.^2-4)/2;  
  
  plot(hw,abs(gp))
  plot(hw,abs(gm))
  
  title('Abs(g) vs. hw')
  xlabel('hw')
  ylabel('abs(g)')
end

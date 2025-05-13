%This program will model adiabatic temperature vs. radius for the photosphere of an AGB star.

clc;
close all; 
graphics_toolkit('gnuplot')

disp("Let's model the adiabatic photosphere of a late-staged asymptotic giant branch (AGB) star.");

%Intialize.
disp('We first need some stellar parameters from the AGB star. ');
disp('You will need the effective temperature and radius.');
Te = input('Enter the effective temperature in Kelvins: ');
R = input('Enter the effective radius in solar units: ');
Re = R*6.95508e8;

%Finding the radii at 4000K and 2000K.
a = power((30*Te) - 57500,0.5);
r4000K = (1/2 + (a/500))*Re;
fprintf('The radii at 4000K is %g meter.\n',r4000K);

r2000K = (5/3)*r4000K;
fprintf('The radii at 2000K is %g meter.\n',r2000K);

%Plotting temperature as a function of radius.
Maxsteps = input('Enter the number of steps: ');
for i = 1:Maxsteps
  
  r = r4000K + ((r2000K-r4000K)/i);
  R = r/r2000K;
  P_over_Po = [(4000 - (25000/3)*(((r-r4000K)*r4000K)/power(r,2)))/2000]^(4/7);
  xplot(i) = R;                %Record for plotting.
  yplot(i) = P_over_Po;
  
end

%Plotting pressure as a function of radius.
plot(xplot,yplot);
grid on;
xlabel('R/(R_{2000K})');
ylabel('P/P_o');
title('Adiabatic Pressure vs. Radius');

print("Adiabatic_Pressure_Plot.png");
refresh;
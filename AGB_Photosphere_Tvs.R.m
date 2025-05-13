%This program will model temperature vs. radius for the photosphere of an AGB star.

clc;
close all; 

disp("Let's model the photosphere of a late-staged asymptotic giant branch (AGB) star.");

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
  T = 4000 - (25000/3)*(((r-r4000K)*r4000K)/power(r,2));
  xplot(i) = r;                %Record for plotting.
  yplot(i) = T;
  
end

%Plotting temperature as a function of radius.
plot(xplot,yplot);
grid on;
xlabel('Radius of the Star (meters)');
ylabel('Temperature (Kelvins)');
title('Temperature vs. Radius for the Photosphere of an AGB Star');
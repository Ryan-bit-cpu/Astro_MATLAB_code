%We will model the pulsation of an AGB star.

clc;
close all; 
graphics_toolkit('gnuplot')

%Intialize
Te=input('Enter the effective temperature in Kelvins: ');
R=input('Enter the effective radius in solar units: ');
Re=R*6.95508e8;
p=input('Enter the pulsation of the star in days: ');
P=p*24*3600;                    %Stellar pulsation in seconds

%Finding the radii at 4000K and 2000K.
a = power((30*Te) - 57500,0.5);
r4000K = (1/2 + (a/500))*Re;
fprintf('The radii at 4000K is %g meters.\n',r4000K);

r2000K = (5/3)*r4000K;
fprintf('The radii at 2000K is %g meters.\n',r2000K);

%Find the pulsation of the effective radius.
time=input('Enter how long you want the "star" to pulse: ');
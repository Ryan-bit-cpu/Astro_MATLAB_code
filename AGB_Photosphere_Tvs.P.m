%Let's plot temperature as a function of pressure for a given AGB star.

clc;
close all; 
graphics_toolkit('gnuplot')

fprintf("Let's model the photosphere of an AGB star.\nWe first need to know some stellar parameters of the star.\nLike, the effective temperature and radius.\n");
fprintf('As well as know some things about the growth rate of graphite in the photosphere.\nAssume the growth rate is a carbon core\ngrowing in the photosphere.\nThe carbon core is made of graphite.\n');

%Intialize
k=1.38065e-23;                  %Boltzmann's Constant (J/K)
N_A=6.0221409e23;               %Avogadro's Number (atoms/mole)
mu=0.012011;                    %The molecular weight of carbon in kg/mole.
m=0.012011;                     %The molecular mass of carbon in kg/mole.
delta=0.0356667e-10;            %The growth rate in m/s.
a=input('Enter the size of the chunk of graphite in microns: ');
a_core=a*(1e-6);                %Converted from microns to meters.
a_carbon=0.0914e-9;             %Size of a single carbon atom in meters.
V_carbon=(4/3)*pi*(a_carbon^3); %Volume of a single carbon atom in m^3.
V_core=(4/3)*pi*(a_core^3);     %Volume of the carbon core m^3.
N_carbon=V_core/V_carbon;       %The number of carbon atoms in the carbon core.
m_carbon=1.99e-26;              %The mass of a single carbon atom in kg. 
mass=m_carbon*N_carbon;         %The estimated mass of the carbon core in kg
fprintf('The mass of the carbon core is %g kg.\n',mass);
rho=mass/((4/3)*pi*(a_core)^3); %Density of the solid kg/m^3.
fprintf('The density of the solid is %g kg/m^3.\n',rho);

Te=input('Enter the effective temperature in Kelvins: ');
R=input('Enter the effective radius in solar units: ');
Re=R*6.95508e8;

%Finding the radii at 4000K and 2000K.
a = power((30*Te) - 57500,0.5);
r4000K = (1/2 + (a/500))*Re;
fprintf('The radii at 4000K is %g meters.\n',r4000K);

r2000K = (5/3)*r4000K;
fprintf('The radii at 2000K is %g meters.\n',r2000K);

alpha=((2*rho*N_A*delta)/(mu));

%Find the number density vs. radius in the photosphere of an AGB star.
Maxsteps = input('Enter the number of steps you like to travel through the photosphere: ');
for i = 1:Maxsteps
  
  r = r4000K + ((r2000K-r4000K)/i);
  T = 4000 - (25000/3)*(((r-r4000K)*r4000K)/power(r,2));
  P = log10([alpha*power((pi*m*k)/(2),0.5)*[4000 - ((25000/3)*(((r-r4000K)*r4000K)/power(r,2)))]^(0.5)]/101325);
  xplot(i) = T;                %Record for plotting.
  yplot(i) = P;
  
end

%Plotting temperature as a function of pressure.
plot(xplot,yplot);
grid on;
xlabel('Temperature (Kelvins)');
ylabel('Log Base 10 of the Pressure (atm)');
title('Pressure vs. Temperature');

print("P_vs_T.png");
refresh;
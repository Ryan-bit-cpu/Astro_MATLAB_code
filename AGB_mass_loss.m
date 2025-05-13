clear all ;clc ;

fprintf("Let's plot the mass of an AGB star using Reimers mass loss rate.\n");
fprintf("The units are in solar units.\n");

%Intialize
M(1) = input('Enter the initial mass: ');
n = 1;                                    %free parameter
L(1) = input('Enter the initial luminosity: ');
R(1) = input('Enter the initial effective radius: ');
istep = input('Enter the number of steps: ');
time = zeros(istep,1);

%%%Main Loop%%%
for i=1:istep
  
  M(i+1)=(-0.0000000000004)*((L*R)/M(i)); %Reimers mass loss equation

  if(M(i+1)<0)
    L(i+1)=L(i)+1;
    R(i+1)=R(i)+1;
    time(i+1)=time(i)+istep; 
  else
    M=0;
  endif 

endfor

%Plot mass vs. time
plot(M,time,'b-');
xlabel('Mass (solar units)');
ylabel('time (years)');
title('The Mass Loss of an AGB star');
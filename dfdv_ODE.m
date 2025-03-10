%% Solve ODEs
% Matthew Oakley

% Inintial conversions and temperature of reactant species
y0=[3.73 45.739 0 0 0 0 1.288 0.05959 328]

% Time span taken
tspan=linspace(0,3000,1200)

% Funtion solver to find concentrations
[tout,yout]=ode15s('dfdv',tspan,y0)

%% Plot Graph

% initial mole flow rates
 %f0=[13446.06 164661.28 0 0 0 0 4637.5 214.52]


% with lines in diffrent colour
plot(tout, yout(:,1), 'r-',tout, yout(:,2), 'g--', tout, yout(:,3), 'b:', tout, yout(:,4), 'm-', tout, yout(:,5), 'y--', tout, yout(:,6), 'c:', tout, yout(:,7), 'g-o', tout, yout(:,8), 'r--')%, tout, y0(:,9), 'b-')
legend('[TG]', '[MeOH]', '[DG]', '[FAME]', '[MG]', '[GL]', '[FFA]', '[H2O]')
%% kmol
Kmol=yout/1000

plot(tout, Kmol(:,1), 'r-',tout, Kmol(:,2), 'g--', tout, Kmol(:,3), 'b:', tout, Kmol(:,4), 'm-', tout, Kmol(:,5), 'y--', tout, Kmol(:,6), 'c:', tout, Kmol(:,7), 'g-o', tout, Kmol(:,8), 'r--')%, tout, y0(:,9), 'b-')
legend('[TG]', '[MeOH]', '[DG]', '[FAME]', '[MG]', '[GL]', '[FFA]', '[H2O]')

%% dx/dv
FFFA=yout(:,7)
FTG=yout(:,1)

FFAX=((1.288-FFFA)/1.288)*100
TGX=((3.735-FTG)/3.735)*100

plot(tout, FFAX, '--', tout, TGX)

%% Convesion
plot(tout, FFAX)
xlabel('Volume (L)')
ylabel('Conversion (%)')
fontname("Times New Roman")
%% dx/dt
Time=(tout/5.8689)/60

plot(Time,FFAX)
xlabel('Time (min)')
ylabel('Conversion (%)')
fontname("Times New Roman")
%% dc/dv
Conc=yout(:,1:8)/5.8689

plot(tout, Conc(:,1), 'r-',tout, Conc(:,2), 'g--', tout, Conc(:,3), 'b:', tout, Conc(:,4), 'm-', tout, Conc(:,5), 'y--', tout, Conc(:,6), 'c:', tout, Conc(:,7), 'g-o', tout, Conc(:,8), 'r--')
xlabel('Volume (L)')
ylabel('Concentration (mol/L)')
fontname("Times New Roman")
%% dc/dt

plot(Time, Conc(:,1), 'r-', Time, Conc(:,2), 'g--', tout, Conc(:,3), 'b:', Time, Conc(:,4), 'm-', Time, Conc(:,5), 'y--', Time, Conc(:,6), 'c:', Time, Conc(:,7), 'g-o', Time, Conc(:,8), 'r--')
xlabel('Time (min)')
ylabel('Concentration (mol/L)')
fontname("Times New Roman")
%% dT/dv

Temp=yout(:,9)-273
plot(tout, Temp)

xlabel('Volume (L)')
ylabel('Tempertature (Celcius)')
fontname("Times New Roman")
%% dT/dt
plot(Time, Temp)
xlabel('Time (min)')
ylabel('Tempertature (Celcius)')
fontname("Times New Roman")
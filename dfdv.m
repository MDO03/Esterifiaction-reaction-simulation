function [dXsdt]=reactor(t, y)
% [Outputs] = functionName (input1, input2)

% E
E=8.314

% Temperature
T=y(9)

% K
k1=(1.59)*exp((-38700/E)*(1/y(9)))
k2=(0.33)*exp((-38700/E)*(1/y(9)))
k3=(3.194)*exp((-38700/E)*(1/y(9)))
k4=(5.97)*exp((-38700/E)*(1/y(9)))
k5=(1.01*10^11)*exp((-107101/E)*(1/y(9)))
k6=(0.0004)*exp((-38740/E)*(1/y(9)))
k7=(14750)*((2/(7.12+2)))*(exp((-44768.75)/(E*y(9))))
k8=(2.8)*((2/(0.0568+2)))*(exp((-29413)/(E*y(9))))


% specific heat capacities J/mol K
Cp1=1254.8+(1.7709*y(9))+(0*(y(9)^2))
Cp2=40.152+(0.31046*y(9))+(-0.0010291*(y(9)^2))+((1.4588*10^-6)*(y(9)^3))
Cp3=1254.8+(1.7709*y(9))+(0*(y(9)^2))
Cp4=496.29+(-0.2155*y(9))+(1.740*(y(9)^2))
Cp5=1254.8+(1.7709*y(9))+(0*(y(9)^2))
Cp6=137.654+(0.3184*y(9))+(-0.0001125*(y(9)^2))
Cp7=278.686+(2.5434*y(9))+(-0.0054355*(y(9)^2))+(0.000004924*(y(9)^3))
Cp8=-203.6060+(1523.290*(y(9)/1000))+(-3196.413*((y(9)/1000)^2))+(2474.455*((y(9)/1000)^3))+(3.855326/((y(9)/1000)^2))
Cp9=26.004+(0.70337*y(9))+(-0.0013856*(y(9)^2))+((1.0342*10^-6)*(y(9))^3)

% heat of reaction
Hx1=((808000-640000)-(197000-238400))+(((Cp3+Cp4)-(Cp1+Cp2))*(y(9)-298))
Hx2=((197000-238400)-(808000-640000))+(((Cp1+Cp2)-(Cp3+Cp4))*(y(9)-298))
Hx3=((569000-640000)-(808000-238400))+(((Cp5+Cp4)-(Cp3+Cp2))*(y(9)-298))
Hx4=((808000-238400)-(569000-640000))+(((Cp3+Cp2)-(Cp5+Cp4))*(y(9)-298))
Hx5=((-669600-640000)-(569000-238400))+(((Cp6+Cp4)-(Cp5+Cp2))*(y(9)-298))
Hx6=((569000-238400)-(-669600-640000))+(((Cp5+Cp2)-(Cp6+Cp4))*(y(9)-298))
Hx7=((-285830-640000)-(-764800-238400))+(((Cp8+Cp4)-(Cp7+Cp2))*(y(9)-298))
Hx8=0

% Ua
U=24
%D=
A=35
Ta=363

% initial mole flow rates
ftg0=3.735
falc0=45.739
fdg0=0
fest0=0
fmg0=0
fgl0=0
fffa0=1.288
fwater0=0.05959

% volumetric flowrate
u=5.8689

% concentration in terms of X
ctg=(y(1)/u)
calc=(y(2)/u)
cdg=(y(3)/u)
cest=(y(4)/u)
cmg=(y(5)/u)
cgl=(y(6)/u)
cffa=(y(7)/u)
cwater=(y(8)/u)

% Reaction Rates
r1=(k1*ctg*calc)
r2=(k2*cdg*cest)
r3=(k3*cdg*calc)
r4=(k4*cmg*cest)
r5=(k5*cmg*calc)
r6=(k6*cgl*cest)
r7=(k7*cffa*calc)
r8=(k8*cwater*cest)
%(k8*cwater*cest)
% ((0.0121)/((1+k_1*cest*cwater)+((k_2*cest*cwater)/cffa)+(k_3*cest)))*((k7*cffa)-((k8*cest*cwater)/calc))

% ODEs of each species in the reactor
dX1dv=(-r1+r2)
dX2dv=(-r1-r3-r5-r7+r2+r4+r6+r8)
dX3dv=(r1-r2-r3+r4)
dX4dv=(r1+r3+r5+r7-r2-r4-r6-r8)
dX5dv=(r3-r4-r5+r6)
dX6dv=(r5-r6)
dX7dv=(-r7+r8)
dX8dv=(r7-r8)
dX9dv=(((U*A)*(Ta-y(9)))-((r1*Hx1)+(r2*Hx2)+(r3*Hx3)+(r4*Hx4)+(r5*Hx5)+(r6*Hx6)+(r7*Hx7)+(r8*Hx8)))/((y(1)*Cp1)+(y(2)*Cp2)+(y(3)*Cp3)+(y(4)*Cp4)+(y(5)*Cp5)+(y(6)*Cp6)+(y(7)*Cp7)+(y(8)*Cp8)+(0.0708*Cp9))
%dX10dv=((U*A)*(y(10)-y(9)))/()

% Combine all ODEs into a single matrix
dXsdt=[dX1dv; dX2dv; dX3dv; dX4dv; dX5dv; dX6dv; dX7dv; dX8dv; dX9dv]
end
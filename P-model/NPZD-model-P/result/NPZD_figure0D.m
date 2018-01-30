% this script is used to plot the result from NPZD model.

X=[1:200];
N1=outputNPZDI1(1:200,2);
P1=outputNPZDI1(201:400,2);
Z1=outputNPZDI1(401:600,2);
D1=outputNPZDI1(601:800,2);
N1=table2array(N1);
P1=table2array(P1);
Z1=table2array(Z1);
D1=table2array(D1);
subplot(4,1,1)
h1=plot(X,N1,'r');hold on;
h2=plot(X,P1,'b');hold on;
h3=plot(X,Z1,'g');hold on;
h4=plot(X,D1,'y');hold on;
h5=plot(X,N1+P1+Z1+D1,'k')

title('I=0.5*Io')
xlabel('Time (day)')
legend([h1,h2,h3,h4,h5],'N','P','Z','D','N+P+Z+D')

subplot(4,1,2)
X=[1:200];
N2=outputNPZDI2(1:200,2);
P2=outputNPZDI2(201:400,2);
Z2=outputNPZDI2(401:600,2);
D2=outputNPZDI2(601:800,2);
N2=table2array(N2);
P2=table2array(P2);
Z2=table2array(Z2);
D2=table2array(D2);
h1=plot(X,N2,'r');hold on;
h2=plot(X,P2,'b');hold on;
h3=plot(X,Z2,'g');hold on;
h4=plot(X,D2,'y');hold on;
h5=plot(X,N2+P2+Z2+D2,'k')

title('I=Io')
xlabel('Time (day)')
legend([h1,h2,h3,h4,h5],'N','P','Z','D','N+P+Z+D')

subplot(4,1,3)
X=[1:200];
N3=outputNPZDI3(1:200,2);
P3=outputNPZDI3(201:400,2);
Z3=outputNPZDI3(401:600,2);
D3=outputNPZDI3(601:800,2);
N3=table2array(N3);
P3=table2array(P3);
Z3=table2array(Z3);
D3=table2array(D3);
h1=plot(X,N3,'r');hold on;
h2=plot(X,P3,'b');hold on;
h3=plot(X,Z3,'g');hold on;
h4=plot(X,D3,'y');hold on;
h5=plot(X,N3+P3+Z3+D3,'k')

title('I=2*Io')

xlabel('Time (day)')
legend([h1,h2,h3,h4,h5],'N','P','Z','D','N+P+Z+D')

subplot(4,1,4)
X=[1:200];
N4=outputNPZDI4(1:200,2);
P4=outputNPZDI4(201:400,2);
Z4=outputNPZDI4(401:600,2);
D4=outputNPZDI4(601:800,2);
N4=table2array(N4);
P4=table2array(P4);
Z4=table2array(Z4);
D4=table2array(D4);
h1=plot(X,N4,'r');hold on;
h2=plot(X,P4,'b');hold on;
h3=plot(X,Z4,'g');hold on;
h4=plot(X,D4,'y');hold on;
h5=plot(X,N4+P4+Z4+D4,'k')

title('I=3*Io')
xlabel('Time (day)')
legend([h1,h2,h3,h4,h5],'N','P','Z','D','N+P+Z+D')


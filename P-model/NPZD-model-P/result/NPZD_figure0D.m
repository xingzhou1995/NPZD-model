% this script is used to plot the result from NPZD model.

X=[1:200];
N1=outputNPZD1(1:200,2);
P1=outputNPZD1(201:400,2);
Z1=outputNPZD1(401:600,2);
D1=outputNPZD1(601:800,2);
N1=table2array(N1);
P1=table2array(P1);
Z1=table2array(Z1);
D1=table2array(D1);
%subplot(4,1,1)
h1=plot(X,N1,'r');hold on;
h2=plot(X,P1,'b');hold on;
h3=plot(X,Z1,'g');hold on;
h4=plot(X,D1,'y');hold on;
h5=plot(X,N1+P1+Z1+D1,'k')

title('Initial value:N=0.1,P=0.1,Z=0.1,D=0.2')
xlabel('Time (day)')
legend([h1,h2,h3,h4,h5],'N','P','Z','D','N+P+Z+D')

%subplot(4,1,2)
%X=[1:200];
%N2=outputNPZDI2(1:200,2);
%P2=outputNPZDI2(201:400,2);
%Z2=outputNPZDI2(401:600,2);
%D2=outputNPZDI2(601:800,2);
%N2=table2array(N2);
%P2=table2array(P2);
%Z2=table2array(Z2);
%D2=table2array(D2);
%h1=plot(X,N2,'r');hold on;
%h2=plot(X,P2,'b');hold on;
%h3=plot(X,Z2,'g');hold on;
%h4=plot(X,D2,'y');hold on;
%h5=plot(X,N2+P2+Z2+D2,'k')

%title('I=Io')
%xlabel('Time (day)')
%legend([h1,h2,h3,h4,h5],'N','P','Z','D','N+P+Z+D')


% this script is used to plot the result from NPZD model.
t=200;
X=[1:200];
N1=outputNPZD4(1:200,2);
P1=outputNPZD4(201:400,2);
Z1=outputNPZD4(401:600,2);
D1=outputNPZD4(601:800,2);
N1=table2array(N1);
P1=table2array(P1);
Z1=table2array(Z1);
D1=table2array(D1);
subplot(2,1,1)
h1=plot(X(1:t),N1(1:t),'r');hold on;
h2=plot(X(1:t),P1(1:t),'b');hold on;
h3=plot(X(1:t),Z1(1:t),'g');hold on;
h4=plot(X(1:t),D1(1:t),'y');hold on;
!h5=plot(X,N1+P1+Z1+D1,'k')

title(['Initial value:','N=',num2str(N1(1)),'P=',num2str(P1(1)),'Z=',num2str(Z1(1)),'D=',num2str(D1(1))])
xlabel('Time (day)')
ylabel('mmol C/m^3')
legend([h1,h2,h3,h4],'N','P','Z','D')


subplot(2,1,2)
plot(X,N1+P1+Z1+D1)
xlabel('Time (day)')
ylabel('mmol C/m^3')
legend('N+P+Z+D')
%X=[1:200];
%N2=outputNPZD3(1:200,2);
%P2=outputNPZD3(201:400,2);
%Z2=outputNPZD3(401:600,2);
%D2=outputNPZD3(601:800,2);
%N2=table2array(N2);
%P2=table2array(P2);
%Z2=table2array(Z2);
%D2=table2array(D2);
%h1=plot(X(1:t),N2(1:t),'r');hold on;
%h2=plot(X(1:t),P2(1:t),'b');hold on;
%h3=plot(X(1:t),Z2(1:t),'g');hold on;
%h4=plot(X(1:t),D2(1:t),'y');hold on;
%h5=plot(X,N2+P2+Z2+D2,'k')

%title('Initial value:N=13,P=5,Z=0.5,D=10')
%xlabel('Time (day)')
%ylabel('mg P/m^3')
%legend([h1,h2,h3,h4],'N','P','Z','D')


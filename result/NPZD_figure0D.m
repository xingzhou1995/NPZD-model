% this script is used to plot the result from NPZD model.

X=[1:200];
N1=outputNPZD(1:200,2);
P1=outputNPZD(201:400,2);
Z1=outputNPZD(401:600,2);
D1=outputNPZD(601:800,2);
N1=table2array(N1);
P1=table2array(P1);
Z1=table2array(Z1);
D1=table2array(D1);
subplot(2,1,1)
h1=plot(X,N1,'r');hold on;
h2=plot(X,P1,'b');hold on;
h3=plot(X,Z1,'g');hold on;
h4=plot(X,D1,'y');hold on;
h5=plot(X,N1+P1+Z1+D1,'k')


xlabel('Time (day)')
legend([h1,h2,h3,h4,h5],'N','P','Z','D','N+P+Z+D')

subplot(2,1,2)
!h1=plot(X,N1,'r');hold on;
h2=plot(X,P1,'b');hold on;
h3=plot(X,Z1,'g');hold on;
h4=plot(X,D1,'y');hold on;
!h5=plot(X,N1+P1+Z1+D1,'k')


xlabel('Time (day)')
!K1=legend([h1,h2,h3,h4,h5],'N','P','Z','D','N+P+Z+D')
legend([h2,h3,h4],'P','Z','D')

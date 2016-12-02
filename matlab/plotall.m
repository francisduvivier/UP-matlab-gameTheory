VAPT = 2.1946
APT = 2.1235
VAPNT = 1.8344
APNT = 2.2774

p=(APNT-VAPNT)/(-APT+APNT+VAPT-VAPNT)
q=(VAPNT-VAPT)/(APT-VAPT-APNT+VAPNT)
E2=p*(q*-APT+(1-q)*-VAPT)+(1-p)*(q*-APNT+(1-q)*-VAPNT)
E1=q*(p*APT+(1-p)*APNT)+(1-q)*(p*VAPT+(1-p)*VAPNT)
q=0:0.001:1;

p=0;
E10=q*(p*APT+(1-p)*APNT)+(1-q)*(p*VAPT+(1-p)*VAPNT);
p=1;
E11=q*(p*APT+(1-p)*APNT)+(1-q)*(p*VAPT+(1-p)*VAPNT);
hold off;
plot(q,E10);
hold on;
plot(q,E11,'r');
legend('p=0','p=1');
axes;
hold off;
plot(q,E10);
hold on;
plot(q,E11,'r');
legend('p=0','p=1');
xlabel('q');
ylabel('E1: Player 1 Utility');
p=0:0.001:1;
q=0;
E20=p*(q*-APT+(1-q)*-VAPT)+(1-p)*(q*-APNT+(1-q)*-VAPNT);
q=1;
E21=p*(q*-APT+(1-q)*-VAPT)+(1-p)*(q*-APNT+(1-q)*-VAPNT);
figure(2);
plot(p,E20);
hold on;
plot(p,E21,'r');
legend('q=0','q=1');
xlabel('p');
ylabel('E2: Player 2 Utility');

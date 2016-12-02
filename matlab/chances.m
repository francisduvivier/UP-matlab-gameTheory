function [AttackWinPCT]=chances(A,D)
close all
simnum=100000;
n=1;
Wins=[0,0];
while n<=simnum
AttackTroop = zeros(30,1);
DefendTroop = zeros(30,1);
AttackTroop(1) = A;
DefendTroop(1) = D;
i=2;
while AttackTroop(i-1)>0 && DefendTroop(i-1)>0
if AttackTroop(i-1)<=3
xa=AttackTroop(i-1);
else
xa=3;
end
if DefendTroop(i-1)<=2
xd=DefendTroop(i-1);
else
xd=2;
end
Dice = min(xa,xd);
a = 6*rand(1,xa);
AttackDice=sort(ceil(a),'descend');
d = 6*rand(1,xd);
DefendDice=sort(ceil(d),'descend');
ADice(1)=AttackDice(1);
DDice(1)=DefendDice(1);
if ADice(1)>DDice(1)
DefendT=DefendTroop(i-1)-1;
AttackT=AttackTroop(i-1);
else
AttackT=AttackTroop(i-1)-1;
DefendT=DefendTroop(i-1);
end
if Dice==2
ADice(2)=AttackDice(2);
DDice(2)=DefendDice(2);
if ADice(2)>DDice(2)
DefendT=DefendT-1;
else
AttackT=AttackT-1;
end
end
AttackTroop(i)=AttackT;
DefendTroop(i)=DefendT;
i=i+1;
end
if DefendT==0
Wins(1)=Wins(1)+1;
else
Wins(2)=Wins(2)+1;
end
n=n+1;
end
AttackWinPCT=round(1000*Wins(1)/simnum)/10;
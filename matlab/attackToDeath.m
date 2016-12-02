function [P1Left,P2Left]=attackToDeath(A,D)
AttackTroop = zeros(ceil(A)+ceil(D)-1,1);
DefendTroop = zeros(ceil(A)+ceil(D)-1,1);
AttackTroop(1) = floor(A)-1;
if(rand<A-floor(A))
    AttackTroop(1)=AttackTroop(1)+1;
end
DefendTroop(1) = floor(D);
if(rand<(D-floor(D)))
    DefendTroop(1)=DefendTroop(1)+1;
end
i=2;
AttackT= AttackTroop(1);
DefendT=DefendTroop(1);
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
P1Left=AttackT+1;
P2Left=DefendT;
end
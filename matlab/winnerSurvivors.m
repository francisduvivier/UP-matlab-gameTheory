function [P1Utility]=winnerSurvivors(A,D,LandUtil)
close all
simnum=100000;
n=1;
Wins=[0,0];
P1Survivors=0;
P2Survivors=0;
while n<=simnum
       [AttackT,DefendT]=attackToDeath(A,D);
    if DefendT==0
        Wins(1)=Wins(1)+1;
        P1Survivors=P1Survivors+AttackT;
    else
        Wins(2)=Wins(2)+1;
        P2Survivors=P2Survivors+DefendT;
    end
    n=n+1;
end
A1WinPCT=Wins(1)/simnum

P1Survivors;
Wins;
MedP1Survivors=P1Survivors/Wins(1);%het gemiddeld aantal legers dat een winnende confrontatie overleefd heeft. 
                                        %Voor index 1 is dat voor speler 1 een aanval op L2 en 
                                        %index 2 geeft de beurt van speler 2 aan waarin er terug aangevallen wordt.
P2Survivors;
MedP2Survivors=P2Survivors/Wins(2);
P1ArmiesLost=-1*((1-A1WinPCT)*(-A)+ A1WinPCT*(-A+MedP1Survivors))
%P1ArmiesLost=-1*((1-A1WinPCT)*(-A)+ A1WinPCT*(-A+MedP1Survivors)); %als er verloren wordt, verliest men alle aanvallende armies heir als extra straf voor verliezen
P2ArmiesLost=-1*((1-A1WinPCT)*(-D+MedP2Survivors)+A1WinPCT*(-D));
ArmyDiff=-P1ArmiesLost+P2ArmiesLost;
P1Utility= ArmyDiff+(A1WinPCT)*LandUtil;
end 




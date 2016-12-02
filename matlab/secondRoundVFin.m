function [P1Utility1,P1Utility2]=secondRound(A,D,A2)
close all
simnum=100000;%10000
n=1;
%3 rijen voor 3 attack ronden.
Wins=[0,0;0,0;0,0];
P1Survivors=[0,0,0];
P2Survivors=[0,0,0];
while n<=simnum
    [AttackT(1),DefendT(1)]=attackToDeath(A,D);
    
    if DefendT(1)>0%Speler 2 heeft de 1e aanval overleeft.
        Wins(1,2)=Wins(1,2)+1; %wins(1,2) betekent het aantal keer dat speler 2 de eerste aanval overleeft heeft.
        P2Survivors(1)=P2Survivors(1)+DefendT(1);
        
    else
        
        Wins(1,1)=Wins(1,1)+1;
        P1Survivors(1)=P1Survivors(1)+AttackT(1);
        
        D2=AttackT(1)-1;%als de aanvaller wint, zal hij 1 troep moeten overlaten en kan hij met de rest verdedigen op het ingenomen land.
        [AttackT(2),DefendT(2)]=attackToDeath(A2,D2);
        if DefendT(2)==0
            
            Wins(2,2)=Wins(2,2)+1;
            P2Survivors(2)=P2Survivors(2)+AttackT(2);
            
            
        else %als speler 1 miraculeus genoeg de tegenaanval overleeft
            Wins(2,1)=Wins(2,1)+1;
            P1Survivors(2)=P1Survivors(2)+DefendT(2);
            
        end
    end
    n=n+1;
end


A1WinPCT=Wins(1,1)/ simnum; %de kans dat in ronde 1 de aanval van speler 1 lukt
A2WinPCT=Wins(2,2)/ (Wins(2,1)+Wins(2,2)); %de kans dat speler 2 wint als hij terug aanvalt
P1Survivors;
Wins(1:end,1);
MedP1Survivors=P1Survivors./transp(Wins(1:end,1));%het gemiddeld aantal legers dat een winnende confrontatie overleefd heeft.
%Voor index 1 is dat voor speler 1 een aanval op L2 en
%index 2 geeft de beurt van speler 2 aan waarin er terug aangevallen wordt.
P2Survivors;
Wins(1:end,2);
LandUtil=8/3;
MedP2Survivors=P2Survivors./transp(Wins(1:end,2));
P1ArmiesLost=-1*((1-A1WinPCT)*(-A+1)+ A1WinPCT*(A2WinPCT*(-A+1)+(1-A2WinPCT)*(-A+1+MedP1Survivors(2))));
P2ArmiesLost=-1*((1-A1WinPCT)*(-D+MedP2Survivors(1))+A1WinPCT*(A2WinPCT*(-A2-D+MedP2Survivors(2)+1)+(1-A2WinPCT)*(-A2-D+1)));
ArmyDiff=-P1ArmiesLost+P2ArmiesLost;
P1Utility2= ArmyDiff+(A1WinPCT)*(1-A2WinPCT)*LandUtil;

P1ArmiesLost=-1*((1-A1WinPCT)*(-A+1)+ A1WinPCT*(-A+MedP1Survivors(1)));
P2ArmiesLost=-1*((1-A1WinPCT)*(-D+MedP2Survivors(1))+A1WinPCT*(-D));
ArmyDiff=-P1ArmiesLost+P2ArmiesLost;
P1Utility1= ArmyDiff+(A1WinPCT)*LandUtil;

end
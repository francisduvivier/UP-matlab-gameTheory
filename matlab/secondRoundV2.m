function [P1Utility]=secondRoundV2(A,D,A2,extra)
close all
simnum=100000;
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
        %het volgende zouden we kunnen doen:
        %speler 2 krijgt nu 3 legers extra, die hij op L2 zet en daarmee
        %valt hij L1 aan;
        %A4=DefendT(1)-1+3;
        %D4=1;
        %[AttackT(4),DefendT(4)]=attackToDeath(A4,D4);
        %       if DefendT(4)==0
        %                     P2Survivors(4)=P2Survivors(4)+1;%Want speler 2 behoud 1 speler op het land waaruit hij aangevallen heeft
        %                     Wins(4,2)=Wins(4,2)+1;
        %                     P2Survivors(4)=P2Survivors(4)+AttackT(4);
        %                 else
        %                     Wins(4,1)=Wins(4,1)+1;
        %                     P1Survivors(4)=P1Survivors(4)+DefendT(4);
        %                 end
        
    else
        
        Wins(1,1)=Wins(1,1)+1;
        P1Survivors(1)=P1Survivors(1)+AttackT(1);
        
        D2=AttackT(1)-1;%%als de aanvaller wint, zal hij 1 troep moeten overlaten en kan hij met de rest verdedigen op het ingenomen land.
        
        
        if(A2>=D2+extra)
%         if(1==1)
            [AttackT(2),DefendT(2)]=attackToDeath(A2,D2);
            if DefendT(2)==0
                % het volgende zouden we kunnen doen:
                %             A3=AttackT(2)-1;%nu lanceert speler 2 nog een aanval op L1 om s1 te verzwakken en omdat daar toch maar 1 land staat.
                %             D3=1; %Op L1 heeft speler 1 maar 1 leger achter gelaten
                %                 [AttackT(3),DefendT(3)]=attackToDeath(A3,D3);
                %                 if DefendT(3)==0
                %                    % P2Survivors(3)=P2Survivors(3)+1;%Want speler 2 behoud 1 speler op het land waaruit hij aangevallen heeft
                %                     Wins(3,2)=Wins(3,2)+1;
                %                     P2Survivors(3)=P2Survivors(3)+AttackT(3);
                %                 else
                %                     Wins(3,1)=Wins(3,1)+1;
                %                     P1Survivors(3)=P1Survivors(3)+DefendT(3);
                %                 end
                
                Wins(2,2)=Wins(2,2)+1;
                P2Survivors(2)=P2Survivors(2)+AttackT(2);
                %             end
                
            else %als speler 1 miraculeus genoeg de tegenaanval overleeft
                %P1Survivors(2)=P1Survivors(2)+1;%Want speler 1 behoud 1 speler op het land waaruit hij aangevallen heeft
                Wins(2,1)=Wins(2,1)+1;
                P1Survivors(2)=P1Survivors(2)+DefendT(2);
                
            end
            
        end
    end
    n=n+1;
end

% AttackWinPCT=round(1000*Wins(1)/simnum)/10;
% P1WinSurvivors=round(1000*P1TotalWinSurvivors/Wins(1))/1000;
% P2WinSurvivors=round(1000*P2TotalWinSurvivors/Wins(2))/1000;
Wins
A1WinPCT=Wins(1,1)/ simnum %de kans dat in ronde 1 de aanval van speler 1 lukt
A2WinPCT=Wins(2,2)/ (Wins(2,1)+Wins(2,2)) %de kans dat speler 2 wint als hij terug aanvalt
CounterAttackRate=(Wins(2,1)+Wins(2,2))/Wins(1,1)
P1Survivors
MedP1Survivors=P1Survivors./transp(Wins(1:end,1))%het gemiddeld aantal legers dat een winnende confrontatie overleefd heeft.
%Voor index 1 is dat voor speler 1 een aanval op L2 en
%index 2 geeft de beurt van speler 2 aan waarin er terug aangevallen wordt.
P2Survivors
MedP2Survivors=P2Survivors./transp(Wins(1:end,2))
% P1ArmiesLost=-1*((1-A1WinPCT)*(-A+1)+ A1WinPCT*((1-CounterAttackRate)*(-A+MedP1Survivors(1))+CounterAttackRate*(A2WinPCT*(-A+1)+(1-A2WinPCT)*(-A+1+MedP1Survivors(2)))))
% P2ArmiesLost=-1*((1-A1WinPCT)*(-A2-D+MedP2Survivors(1)+A2)+A1WinPCT*((1-CounterAttackRate)*(-D)+CounterAttackRate*(A2WinPCT*(-A2-D+MedP2Survivors(2)+1)+(1-A2WinPCT)*(-A2-D+1))))
P1ArmiesLost=-1*((1-A1WinPCT)*(-A)+ A1WinPCT*((1-CounterAttackRate)*(-A+MedP1Survivors(1))+CounterAttackRate*(A2WinPCT*(-A)+(1-A2WinPCT)*(-A+1+MedP1Survivors(2))))) %als ze verliezen dan verliezen ze in deze formule ook automatisch het overgebleven leger van de 1e aanval
P2ArmiesLost=-1*((1-A1WinPCT)*(-A2-D+MedP2Survivors(1)+A2)+A1WinPCT*((1-CounterAttackRate)*(-D)+CounterAttackRate*(A2WinPCT*(-A2-D+MedP2Survivors(2)+1)+(1-A2WinPCT)*(-A2-D+1))))
ArmyDiff=-P1ArmiesLost+P2ArmiesLost
P1Utility= ArmyDiff+(A1WinPCT)*(CounterAttackRate*(1-A2WinPCT)+(1-CounterAttackRate))*8/3;

end
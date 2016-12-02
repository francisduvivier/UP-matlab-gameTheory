function [solution,UtilMatrix]=getUtilMatrix(Min1,Max1,Min2,Max2,Min3,Max3)
UtilMatrix=zeros(Max1-Min1+1,Max2-Min2+1,Max3-Min3+1,2);
solution=0;
for i1=Min1:Max1
    i1
    for i2=Min2:Max2
        
        for  i3=Min3:Max3
            
            [UtilMatrix(i1-Min1+1,i2-Min2+1,i3-Min3+1,1),UtilMatrix(i1-Min1+1,i2-Min2+1,i3-Min3+1,2)]=secondRound(i1,i2,i3);
            
            GoodExtra=goodSituation(i1-Min1+1,i2-Min2+1,i3-Min3+1,UtilMatrix);
             if GoodExtra
               EP1=1/3;
                EP=GoodExtra*EP1;
                GoodExtra
                i1
                i2
                i3
                
                VAPT=UtilMatrix(i1-Min1+1,i2-Min2+1,i3-Min3+1,2)-EP
                APT=UtilMatrix(i1-Min1+1-GoodExtra,i2-Min2+1,i3-Min3+1,2)
                VAPNT=UtilMatrix(i1-Min1+1,i2-Min2+1,i3-Min3+1,1)-EP
                APNT=UtilMatrix(i1-Min1+1-GoodExtra,i2-Min2+1,i3-Min3+1,1)
                solution=solution+1;
            end
            
            
        end
    end
end
end
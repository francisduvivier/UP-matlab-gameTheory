function GoodExtra=goodSituation(i1,i2,i3,utilmatrix)


ep1=1/2;% staat voor enforce penalty

for extra=1:3
    if(i1<=extra)
        GoodExtra=0;
        return;
    end
    
    GoodExtra=extra;
    ep=ep1*extra;
%     extra
    if(utilmatrix(i1,i2,i3,2)-ep<=utilmatrix(i1,i2,i3,1)-ep)
%         utilmatrix(i1,i2,i3,2)-ep
%         utilmatrix(i1,i2,i3,1)-ep
%         '3-if(utilmatrix(i1,i2,i3,2)-ep<=utilmatrix(i1,i2,i3,1)-ep)'
        GoodExtra=0;
    elseif(utilmatrix(i1,i2,i3,1)-ep>=utilmatrix(i1-extra,i2,i3,1))
%         utilmatrix(i1,i2,i3,1)
%         utilmatrix(i1-extra,i2,i3,1)
%         
%         
%         '1-if(utilmatrix(i1,i2,i3,1)-ep>=utilmatrix(i1-extra,i2,i3,1))'
        
        GoodExtra=0;
    elseif(utilmatrix(i1,i2,i3,2)-ep<=utilmatrix(i1-extra,i2,i3,2))
%         utilmatrix(i1,i2,i3,2)
%         utilmatrix(i1-extra,i2,i3,2)
%         '2-if(utilmatrix(i1,i2,i3,2)-ep<=utilmatrix(i1-extra,i2,i3,2))'
        
        GoodExtra=0;
    elseif(utilmatrix(i1-extra,i2,i3,2)>=utilmatrix(i1-extra,i2,i3,1))
%         utilmatrix(i1-extra,i2,i3,2)
%         utilmatrix(i1-extra,i2,i3,1)
%         '4-if(utilmatrix(i1-extra,i2,i3,2)>=utilmatrix(i1-extra,i2,i3,1))'
        GoodExtra=0;
    elseif(utilmatrix(i1,i2,i3,1)<=ep ||utilmatrix(i1,i2,i3,2)<=ep)
        
%         '5-if(utilmatrix(i1,i2,i3,1)<=ep ||utilmatrix(i1,i2,i3,2)<=ep)'
        GoodExtra=0;
    end
    if(GoodExtra)
%         'hi'
        return;
    end
end
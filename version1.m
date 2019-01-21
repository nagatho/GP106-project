%version 1.0
%06/01/2019
%01.45 A.M

m=0;  %Marks
cou=1;%count

while cou<11
    z=showPattern(a,1,4,4);%Output sequence Matrix
    c=ldrMatrix(a,4);%Input sequence Matrix
    if c==z
        m=m+1;
        SSD(a,m);
    else
        SSD(a,m);
        buzzer(a,1,13);
        
    end
     cou=cou+1;
end
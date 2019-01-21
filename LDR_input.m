function LDR=LDR_input(a,length) %this is use for get data from ldr
for i=2:12
    pinMode(a,i,'output') %ready pins
end
strt_length=1; %ge the first eliment
LDR=zeros(1,length);%make zero vector
while strt_length<=length
    if LDR(strt_length)==0
        for i=9:12
            digitalWrite(a,i,0); %off all led
        end
    ldr1=analogRead(a,0);
    ldr2=analogRead(a,1);
    ldr3=analogRead(a,2);
    ldr4=analogRead(a,3);
    ldr5=analogRead(a,4);
    ldr6=analogRead(a,5);
    ldr7=analogRead(a,6);
    ldr8=analogRead(a,7);    
    if ldr1>450
        LDR(strt_length)=1;
        digitalWrite(a,2,1);
        strt_length=strt_length+1;
        pause(0.3)
        digitalWrite(a,2,0);
        pause(1)
    elseif ldr2>450
        LDR(strt_length)=2;
        digitalWrite(a,3,1);
        strt_length=strt_length+1;
        pause(0.3)
        digitalWrite(a,3,0);
        pause(1)
    elseif ldr3>450
        LDR(strt_length)=3;
        digitalWrite(a,4,1);
        strt_length=strt_length+1;
        pause(0.3)
        digitalWrite(a,4,0);
        pause(1)
    elseif ldr4>450
        LDR(strt_length)=4;
        digitalWrite(a,5,1);
        strt_length=strt_length+1;
        pause(0.3)
        digitalWrite(a,5,0);
        pause(1)
    elseif ldr5>450
        LDR(strt_length)=5;
        digitalWrite(a,6,1);
        strt_length=strt_length+1;
        pause(0.3)
        digitalWrite(a,6,0);
        pause(1)
    elseif ldr6>450
        LDR(strt_length)=6;
        digitalWrite(a,7,1);
        strt_length=strt_length+1;
        pause(0.3)
        digitalWrite(a,7,0);
        pause(1)
    elseif ldr7>450
        LDR(strt_length)=7;
        digitalWrite(a,8,1);
        strt_length=strt_length+1;
        pause(0.3)
        digitalWrite(a,8,0);
        pause(1)
    elseif ldr8>450
        LDR(strt_length)=8;
        digitalWrite(a,9,1);
        strt_length=strt_length+1;
        pause(0.3)
        digitalWrite(a,9,0);
        pause(1)        
    end
    end
           
end
for i=9:12
            digitalWrite(a,i,0);
end
return
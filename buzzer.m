%This programme is about buzzer
function buzzer(a,delay,pin)
pinMode(a,pin,'OUTPUT');
digitalWrite(a,pin,1);
pause(delay);
digitalWrite(a,pin,0);
return
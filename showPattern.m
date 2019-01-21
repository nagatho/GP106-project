%This function is about ldr sequence
%SL-Sequence length
%leddelay-Led delay
function c=showPattern(handles,leddelay,SL,led)
   for i=2:9
      pinMode(handles,i,'OUTPUT');%setting pinModes      
   end
n_array = randi([2,led],1,SL);%Random matrix
c=n_array;
%disp(c);

  for i=1:SL
      digitalWrite(handles,n_array(i),1);%getting the pin nmber from matrix
      pause(leddelay);
      digitalWrite(handles,n_array(i),0);
      pause(leddelay);
  end
  
return
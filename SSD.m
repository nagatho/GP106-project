function SSD(board,number)

   for i=30:36
      pinMode(board,i,'OUTPUT');%setting pinModes
   end
   row=[0 1 1 1 1 1 1;%0
        0 1 0 0 0 0 1;%1
        1 0 1 1 0 1 1;
        1 1 1 0 0 1 1;
        1 1 0 0 1 0 1;
        1 1 1 0 1 1 0;
        1 1 1 1 1 1 0;
        0 1 0 0 0 1 1;
        1 1 1 1 1 1 1;
        1 1 0 0 1 1 1;
        0 0 0 0 0 0 0];%OFF
    
   if number>=0
       for x=30:36
           digitalWrite(board,x,row(number+1,x-29));
       end
      
   end

return
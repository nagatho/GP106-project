%Project memary Game
%17/01/2019
%19.37

marks=0;
count=1;
p=1;

%Easy level
if strcmp(level,'Easy')
    while count<11
    z=showPattern(a,0.6,4,4);%pattern Output
    c=ldrMatrix(a,4);%pattern input
        while c==z
           marks=marks+1;
           SSD(a,marks);
           break;
        end
      
        while p<4 && c~=z
          z=showPattern(a,0.6,4,4);%pattern Output
          c=ldrMatrix(a,4);%pattern input
             if c==z
                 marks=marks+1;
                 SSD(a,marks);
                 break;
             end
          SSD(a,marks);   
          p=p+1;
        end
        
        if p==3
            break;
        end
     count=count+1;
     end
    
end


%Medium level
if level=='Medium'
   while count<11
    z=showPattern(a,0.5,10);%pattern Output
    c=ldrMatrix(a,10);%pattern input
      if c==z
         marks=marks+1;
         SSD(a,marks);
      else
          SSD(a,marks);
          p=1;
           while p<=3 %Tries
               buzzer(a,1,13);
               z_1=showPattern(a,0.5,10);
               c_1=ldrMatrix(a,10);
               
               if c_1==z_1
                   marks=marks+1;
                   SSD(a,marks);
                   break;
               end
               p=p+1;
           end
           
           if p==4
              break;
           end
          
      end
      count=count+1;
   end 
    
end

%hard level
if level=='Hard'
    t=0.5;
    while count<11
    z=showPattern(a,t,10);%pattern Output
    c=ldrMatrix(a,10);%pattern input
      if c==z
         marks=marks+1;
         SSD(a,marks);
      else
          SSD(a,marks);
          p=1;
           while p<=3
               buzzer(a,1,13);
               z_1=showPattern(a,t,10);
               c_1=ldrMatrix(a,10);
               
               if c_1==z_1
                   marks=marks+1;
                   SSD(a,marks);
                   break;
               end
               p=p+1;
           end
           
            if p==4
              break;
            end
      end
      count=count+1;
      t=t-0.02;
    end
end
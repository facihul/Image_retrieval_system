function result = Class_label_for_ANMRR(Im)
      
     tp = 0; k=1; fp = 0;
      
      if (Im(1)>0 && Im(1)<21) class_lb = 1;        
    elseif (Im(1)>20 && Im(1)<41) class_lb = 2;
    elseif (Im(1)>40 && Im(1)<61) class_lb = 3;
    elseif (Im(1)>60 && Im(1)<81) class_lb = 4;
    elseif (Im(1)>80 && Im(1)<101) class_lb = 5;        
    elseif (Im(1)>100 && Im(1)<121) class_lb = 6;        
    elseif (Im(1)>120 && Im(1)<141) class_lb = 7;        
    elseif (Im(1)>140 && Im(1)<161) class_lb = 8;        
    elseif (Im(1)>160 && Im(1)<181) class_lb = 9;  
    else  class_lb = 10;  
       end  
       
        
     for i=1:20 
        if (Im(i)>0 && Im(i)<21) class_lbl = 1;       
        elseif (Im(i)>20 && Im(i)<41) class_lbl = 2;
        elseif (Im(i)>40 && Im(i)<61) class_lbl = 3;
        elseif (Im(i)>60 && Im(i)<81) class_lbl = 4;
        elseif (Im(i)>80 && Im(i)<101) class_lbl = 5;        
        elseif (Im(i)>100 && Im(i)<121) class_lbl = 6;        
        elseif (Im(i)>120 && Im(i)<141) class_lbl = 7;        
        elseif (Im(i)>140 && Im(i)<161) class_lbl = 8;        
        elseif (Im(i)>160 && Im(i)<181) class_lbl = 9;  
        else   class_lbl = 10;
        end     
            
         if class_lbl==class_lb      
          tp = tp+1; rank(k) = i; k=k+1; 
         else fp=fp+1;
         end
         
     end    
     
    
     
       result = [tp,rank];

function result = Image_class_for_texture(Im)
      
     tp = 0; fp=0;
      
      if (Im(1)>0 && Im(1)<11) class_lb = 1;        
    elseif (Im(1)>10 && Im(1)<21) class_lb = 2;
    elseif (Im(1)>20 && Im(1)<31) class_lb = 3;
    elseif (Im(1)>30 && Im(1)<41) class_lb = 4;
    elseif (Im(1)>40 && Im(1)<51) class_lb = 5;        
    elseif (Im(1)>50 && Im(1)<61) class_lb = 6;        
    elseif (Im(1)>60 && Im(1)<71) class_lb = 7;        
    elseif (Im(1)>70 && Im(1)<81) class_lb = 8;        
    elseif (Im(1)>80 && Im(1)<91) class_lb = 9;  
    elseif (Im(1)>90 && Im(1)<101) class_lb = 10;
    elseif (Im(1)>100 && Im(1)<111) class_lb = 11;
    elseif (Im(1)>110 && Im(1)<121) class_lb = 12;
    elseif (Im(1)>120 && Im(1)<131) class_lb = 13;        
    elseif (Im(1)>130 && Im(1)<141) class_lb = 14;        
    elseif (Im(1)>140 && Im(1)<151) class_lb = 15;        
    elseif (Im(1)>150 && Im(1)<161) class_lb = 16;        
    elseif (Im(1)>160 && Im(1)<171) class_lb = 17;  
    elseif (Im(1)>170 && Im(1)<181) class_lb = 18;        
    elseif (Im(1)>180 && Im(1)<191) class_lb = 19;      
    else  class_lb = 20;  
       end  
       
       
     for i=1:20 
        if (Im(i)>0 && Im(i)<11) class_lbl = 1;        
    elseif (Im(i)>10 && Im(i)<21) class_lbl = 2;
    elseif (Im(i)>20 && Im(i)<31) class_lbl = 3;
    elseif (Im(i)>30 && Im(i)<41) class_lbl = 4;
    elseif (Im(i)>40 && Im(i)<51) class_lbl = 5;        
    elseif (Im(i)>50 && Im(i)<61) class_lbl = 6;        
    elseif (Im(i)>60 && Im(i)<71) class_lbl = 7;        
    elseif (Im(i)>70 && Im(i)<81) class_lbl = 8;        
    elseif (Im(i)>80 && Im(i)<91) class_lbl = 9;  
    elseif (Im(i)>90 && Im(i)<101) class_lbl = 10;
    elseif (Im(i)>100 && Im(i)<111) class_lbl = 11;
    elseif (Im(i)>110 && Im(i)<121) class_lbl = 12;
    elseif (Im(i)>120 && Im(i)<131) class_lbl = 13;        
    elseif (Im(i)>130 && Im(i)<141) class_lbl = 14;        
    elseif (Im(i)>140 && Im(i)<151) class_lbl = 15;        
    elseif (Im(i)>150 && Im(i)<161) class_lbl = 16;        
    elseif (Im(i)>160 && Im(i)<171) class_lbl = 17;  
    elseif (Im(i)>170 && Im(i)<181) class_lbl = 18;        
    elseif (Im(i)>180 && Im(i)<191) class_lbl = 19;      
    else  class_lbl = 20;  
        end     
            
         if class_lbl==class_lb      
          tp = tp+1; 
         else fp=fp+1;
         end
         
     end    
     
    
     
       result = [tp,fp];

function NMRR = ANMRR(rr)

 Nq= rr(1); W= 2*Nq; 
 Rk = rr(2:end); 
 AVR = sum(Rk)/Nq;
 
 NMRR =(2*AVR - Nq - 1)/ (2*W - Nq + 1); 

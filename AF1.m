function v = AF1(rr,gt)

tp = rr(1); 
fp = rr(2);
fn = gt -tp;
precision  = tp/(tp+fp); 
recall =  tp/(tp+fn);

v = 2*precision*recall/(precision+recall); 



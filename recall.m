function recall(litem)

global globals;
global W;
global ApW;
global score;
global firsten;
global walshvv;
global walshind;
    
x = normvec(rand(globals.ndim, 1)-0.5);
    
[x, iter] = converge(x);

% which item was recalled?    
if ~(iter<globals.maxiters)        
    itptr=globals.llp2;
else       
    itptr=globals.ll + 1;   
    %for j=globals.ll:-1:1
    for j=1:globals.ll
        k = walshind(j);        
        if (~any(abs(x-walshvv(:,k))>globals.smally) | ~any(abs((x * -1)-walshvv(:,k))>globals.smally))        
            itptr=j;            
            break;            
        end        
    end    
end
    
score.PC(litem, itptr)= score.PC(litem, itptr)+1;
score.RT(litem, itptr)= score.RT(litem, itptr)+iter;
    
if (itptr==litem)
   score.spc(itptr) = score.spc(itptr)+1;
   score.rtspc(itptr) = score.rtspc(itptr)+iter;
end
    
if ~(itptr>globals.ll)        
    score.transgrad(litem-itptr+globals.ll) = score.transgrad(litem-itptr+globals.ll)+1;    
end    
    
if (litem==1)        
    firsten = energysym(x, x);        
    supen = firsten;    
else        
    supen = energysym(x, x);    
end    

supeta = -supen/(globals.phis * firsten);    
% response suppression   
ApW = ApW + x * x' * supeta;
    
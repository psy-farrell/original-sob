function [x, iter] = converge(x)

global ApW;
global globals;
    
xold = x;
xorig = xold;
iter=0;
differ = 1;
while ((iter < globals.maxiters) && (differ==1))
    xold = x;    
    x = ApW * xold * globals.bsbalpha;    
    x = x + globals.bsbgamma * xold;    
    x = squash(x);    
    iter = iter+1;    
    differ = any(abs(x-xold)>globals.smally);    
end
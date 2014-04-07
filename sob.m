function sob

global score;
% weights are set up this way as it's much faster than having an A matrix
% and a W matrix (which is slowed down by matrix addition in recall.m
global W; % weight matrix W
global ApW; % combined weights W and A
global globals;
global walshvv;
global walshind;
global eneta;

% initialise scoring structure
score.PC=zeros(globals.ll, globals.llp2);
score.RT=zeros(globals.ll, globals.llp2);
score.spc=zeros(globals.ll, 1);
score.rtspc=zeros(globals.ll, 1);
score.transgrad=zeros(globals.tranz, 1);
score.transrt=zeros(globals.tranz, 1);

eneta = zeros(globals.ll, 1);

for run=1:globals.nruns
    % pretraining
    % quick pretraining--learn en masse using matrix multiplication
    W = walshvv(:,1:globals.nstim) * walshvv(:,1:globals.nstim)' * globals.preta;
    walshind = randperm(globals.nstim);
    
    %list learning
    for litem = 1:globals.ll            
        x = walshvv(:,walshind(litem));
        eneta(litem) = energysym(x, x)/(-globals.phie); % Eq 6
        W = W + x * x' * eneta(litem); % hebbian learning
        % W = W + x * x' * .8; % debugging hebbian learning
    end        
        
    % recall        
    ApW = W;
    for litem=1:globals.ll
        recall(litem);
    end
    
    if (~mod(run,globals.nruns/10))            
        run        
    end
end

eneta
plot(score.spc/globals.nruns);
score.spc/globals.nruns
score.rtspc./score.spc
score.PC/globals.nruns
score.RT./score.PC
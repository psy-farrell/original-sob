% code for PB&R sob
% globals are bad but used extensively to speed up computation
global globals;
global walshvv;

globals.ll=5;
globals.llp2 = globals.ll+2;
globals.tranz = (globals.ll*2)-1;

globals.ndim=256;
globals.ndim2 = globals.ndim^2;

globals.nruns = 500;

globals.bsbalpha = .7;
globals.bsbgamma= .2;
globals.bsbdelta = 0.0;

globals.preta = .02; % equivalent to 20 reps with eta_p=.001

globals.maxiters = 12;
globals.smally = 10^ (-8);
globals.cuelength = 10^ (-4); % minx in previous code
globals.nstim = 50;
globals.walshvv = walsh(globals.ndim);

globals.phie= 600;
globals.phis = 1.4;

% primacy gradient globals for debugging
globals.gamorig = .9;
globals.gamdec = .8;
globals.gammas = globals.gamorig * (globals.gamdec.^(0:globals.ll-1));

walshvv = walsh(globals.ndim);

rand('state', 13295);

sob;
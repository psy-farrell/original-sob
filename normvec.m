function temp = normvec (v)
% normalise a vector to length globals.cuelength
global globals

temp=v/(norm(v)/globals.cuelength);
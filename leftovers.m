
        % iterative pretraining--SLOW
        for litem=1:globals.nstim
            Worig = Worig + globals.walshvv(:,litem)' * (globals.walshvv(:,litem) .* globals.preta);
        end
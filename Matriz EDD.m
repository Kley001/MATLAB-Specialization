%% MATRIZ DIAGONAL DOMINANTE POR FILAS (edd)
% se debe cumplir que |ai,j| > sum(|ai,j|) de j=1 hasta n sin incluir a j=i;
A = [-10 2 -5; 2 -7 3; 1 3 -5];
suma = (sum(abs(A')))' - diag(abs(A)); %el lado derecho de la condición
diago = diag(abs(A)); %lado izquierdo de la condición
resultado = diago > suma % si este vestor resultado es de puros UNOS entonces A es edd
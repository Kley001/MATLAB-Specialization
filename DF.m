function  df = deriveFn (F, n)

% Entrada  - F = funcion SIMBOLICA en terminos de t & y, es decir el y'(t)
%            donde  F = F(t, y) = y'(t) 
%          - n es el numero de derivadas a calcular, la rutina de taylor.m
%            acepta hasta 4.
% 
% Salida   - df = [y',y'',y''',...,y^(n)], vector con las n derivadas, de
%            tipo funcion de Matlab, es decir: @(t,y)

syms t y;
dyi = F;
dyn = [dyi];
for i = 2 : n
    dyi = simplify(diff(dyi,t)+diff(dyi,y)*F);
    dyn(i)=dyi;
end

% La rutina de taylor acepta MINIMO un vector de 4 componentes.
% si el n es menor a 4, se llena el resto del vector con ceros.
if (n < 4)
    for i = n+1 : 4
        dyn(i)=0;
    end
end

df = matlabFunction(dyn,'Vars',{t,y});
df
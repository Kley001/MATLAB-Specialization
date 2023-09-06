function [quad, raices, nodos, coefs] = impropias(f, a, b, N)
 % Función para el cálculo de integrales impropias
 A=0; B=0;
 f =sym(f);
 f1=sym(f);f2=sym(f);f3=sym(f);
 if b==inf && a~=-inf
     A=0;B=1/a;
     syms x
     g=subs(f,x,(1/x))*(1/x^2);
     g=matlabFunction(g);
     v = feval(@(n) n./sqrt(4*n.^2-1), 1:N-1);
     J = diag(v,-1)+diag(v,+1);
     raices = eig(J);
     nodos = (A*(1-raices)+B*(1+raices))/2;
     V = (vander(raices))';
     z = (feval(@(k) (1-(-1).^k)./k, N:-1:1))';
     coefs = V\z;
     quad = ((B-A)/2) * sum(coefs.*feval(g, nodos));
 elseif b~=inf && a==-inf
     A=1/b;B=0;
     syms x
     g=subs(f,x,(1/x))*(1/x^2);
     g=matlabFunction(g);
     v = feval(@(n) n./sqrt(4*n.^2-1), 1:N-1);
     J = diag(v,-1)+diag(v,+1);
     raices = eig(J);
     nodos = (A*(1-raices)+B*(1+raices))/2;
     V = (vander(raices))';
     z = (feval(@(k) (1-(-1).^k)./k, N:-1:1))';
     coefs = V\z;
     quad = ((B-A)/2) * sum(coefs.*feval(g, nodos));
     
 elseif a==inf
     cap=sprintf('¡Error! El extremo inferior al infinito se imputa como -inf');
     fprintf('%s\n',cap);
     
 elseif a~=-inf && b~=inf
     A=a; B=b;
     f=matlabFunction(f);
     v = feval(@(n) n./sqrt(4*n.^2-1), 1:N-1);
     J = diag(v,-1)+diag(v,+1);
     raices = eig(J);
     nodos = (A*(1-raices)+B*(1+raices))/2;
     V = (vander(raices))';
     z = (feval(@(k) (1-(-1).^k)./k, N:-1:1))';
     coefs = V\z;
     quad = ((B-A)/2) * sum(coefs.*feval(f, nodos));
     
 elseif a==-inf && b==inf
     syms x
     f1=subs(f1,x,(1/x))*(1/x^2);
     f1=matlabFunction(f1);
     f2=subs(f2,x,(1/x))*(1/x^2);
     f2=matlabFunction(f2);
     f3=matlabFunction(f3);
     
     
     A1=-1;B1=0;
     v1 = feval(@(n) n./sqrt(4*n.^2-1), 1:N-1);
     J1 = diag(v1,-1)+diag(v1,+1);
     raices1 = eig(J1);
     nodos1 = (A1*(1-raices1)+B1*(1+raices1))/2;
     V1 = (vander(raices1))';
     z1 = (feval(@(k) (1-(-1).^k)./k, N:-1:1))';
     coefs1 = V1\z1;
     quad1 = ((B1-A1)/2) * sum(coefs1.*feval(f1, nodos1));
     
     A2=0;B2=1;
     v2 = feval(@(n) n./sqrt(4*n.^2-1), 1:N-1);
     J2 = diag(v2,-1)+diag(v2,+1);
     raices2 = eig(J2);
     nodos2 = (A2*(1-raices2)+B2*(1+raices2))/2;
     V2 = (vander(raices2))';
     z2 = (feval(@(k) (1-(-1).^k)./k, N:-1:1))';
     coefs2 = V2\z2;
     quad2 = ((B2-A2)/2) * sum(coefs2.*feval(f2, nodos2));
     
     
     A3=-1;B3=1;
     v3 = feval(@(n) n./sqrt(4*n.^2-1), 1:N-1);
     J3 = diag(v3,-1)+diag(v3,+1);
     raices3 = eig(J3);
     nodos3 = (A3*(1-raices3)+B3*(1+raices3))/2;
     V3 = (vander(raices3))';
     z3 = (feval(@(k) (1-(-1).^k)./k, N:-1:1))';
     coefs3 = V3\z3;
     quad3 = ((B3-A3)/2) * sum(coefs3.*feval(f3, nodos3));
     
     quad = quad1 + quad2 + quad3;
     raices = "Para este caso sólo se calcula cuadratura";
     nodos = "Para este caso sólo se calcula cuadratura";
     coefs = "Para este caso sólo se calcula cuadratura";
     
 else
     cap=sprintf('¡Error! Esto no debería suceder, revisa los datos imputados :(');
     fprintf('%s\n',cap);
  
 end
 

end 
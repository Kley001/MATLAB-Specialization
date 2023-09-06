%Matriz tridiagonal
N = 20;
a = 1/6; %Diagonal
b = 1/8; %Superdiagonal
c = 1/5; %Subdiagonal       
M = diag(a*ones(1,N)) + diag(b*ones(1,N-1),1) + diag(c*ones(1,N-1),-1);

%Verificar si una matriz es definida positiva
try chol(A)
    disp('Matrix is symmetric positive definite.')
catch ME
    disp('Matrix is not symmetric positive definite')
end
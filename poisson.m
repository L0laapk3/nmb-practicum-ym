function U = poisson(f, N, north, east, south, west)
%POISSON Temperature division in 1x1 square solving Poisson's equation
%   
h = 1/(N+1);
x = h:h:N*h;
[X,Y] = meshgrid(x);
F = f(X,Y)* h^2;
rvw = zeros(N,N);

rvw(1,:) = - arrayfun(south,x);
rvw(N,:) = - arrayfun(north,x);
rvw(:,1) = rvw(:,1) - arrayfun(west,x).';
rvw(:,N) = rvw(:,N) - arrayfun(east,x).';
F = F + rvw;
for n = 1:N
    F(n,:) = dst(F(n,:));
end
for n = 1:N
    F(:,n) = dst(F(:,n));
end

numerator = 1./(2*(cos(pi*X) + cos(pi*Y) - 2)); %X = h,2h,3h...
U = F.*numerator;

for n = 1:N
    U(:,n) = idst(U(:,n));
end
for n = 1:N
    U(n,:) = idst(U(n,:));
end
end
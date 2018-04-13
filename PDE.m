N = 512;
f = @(x,y) heaviside(x-0.4).*heaviside(-x+0.6).*heaviside(y-0.4).*heaviside(-y+0.6) .* (-100);
north = @(x) 1;
east = @(y) 2;
south = @(x) 2+ sin(pi*x/2);
west = @(y) 3;

U = poisson(f, N, north, east, south, west);

h = 1/(N+1);
x = h:h:N*h;
UResult = zeros(N+2); %UResult bevat ook de randvoorwaarden
UResult(2:N+1,2:N+1) = U;
UResult(1,2:N+1) = arrayfun(south,x);
UResult(N+2,2:N+1) = arrayfun(north,x);
UResult(2:N+1,1) = arrayfun(west,x);
UResult(2:N+1,N+2) = arrayfun(east,x);

xx = 0:h:(N+1)*h;
[XX,YY] = meshgrid(xx);

figure() %3d-oppervlak
s = surf(XX,YY,UResult);
hold on
contour3(XX, YY, UResult, min(U(:)):(max(U(:))-min(U(:)))/17:max(U(:)), 'LineWidth',1, 'Color','k') %contourlijnen op 3d-oppervlak
hold off
xlabel('x');
ylabel('y');
zlabel('u');
s.EdgeColor = 'none';
figure()%2d-contour
contour(XX,YY,UResult,min(U(:)):(max(U(:))-min(U(:)))/37:max(U(:)),'ShowText','on','TextList',min(U(:)):(max(U(:))-min(U(:)))*4/37:max(U(:)));
xlabel('x');
ylabel('y');
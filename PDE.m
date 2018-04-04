N = 512;
f = @(x,y) heaviside(x-0.4).*heaviside(-x+0.6).*heaviside(y-0.4).*heaviside(-y+0.6) .* (-100);
north = @(x) 1;
east = @(y) 2;
south = @(x) 2 + sin(pi*x/2);
west = @(y) 3;

U = poisson(f, N, north, east, south, west);

h = 1/(N+1);
x = h:h:N*h;
UResult = zeros(N+2);
UResult(2:N+1,2:N+1) = U;
UResult(1,2:N+1) = arrayfun(south,x);
UResult(N+2,2:N+1) = arrayfun(north,x);
UResult(2:N+1,1) = arrayfun(west,x);
UResult(2:N+1,N+2) = arrayfun(east,x);

xx = 0:h:(N+1)*h;
[XX,YY] = meshgrid(xx);
figure()
s = surf(XX,YY,UResult);
hold on
contour3(XX, YY, UResult, min(UResult):(max(UResult)-min(UResult))/17:max(UResult), 'LineWidth',1, 'Color','k')
hold off
xlabel('x');
ylabel('y');
zlabel('u');
s.EdgeColor = 'none';
figure()
contour(XX,YY,UResult,min(UResult):(max(UResult)-min(UResult))/37:max(UResult),'ShowText','on','TextList',min(UResult):(max(UResult)-min(UResult))*4/37:max(UResult));
xlabel('x');
ylabel('y');
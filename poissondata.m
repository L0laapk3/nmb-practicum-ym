% f = @(x,y) 0;

% north = @(x) exp(x+1);
% east = @(y) exp(y+1);
% south = @(x) exp(x);
% west = @(y) exp(y);

elapsedTimes = zeros([40,1]);
% u = @(x,y) exp(x+y);

% 
% disp(U)
% mean(elapsedTimes)
maxError = zeros([8,1]);

for i = 3:10
    N = i^2;
    U = poisson(f, N, north, east, south, west);
    h = 1/(N+1);
    x = h:h:N*h;
    [X,Y] = meshgrid(x);
    
    UExact = exp(X + Y);
    
    UDiff = abs(UExact - U);
    maxError(i-2) = max(UDiff(:));
end
% disp(maxError);

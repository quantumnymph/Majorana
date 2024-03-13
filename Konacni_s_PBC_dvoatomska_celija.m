n = 50;

epsilon_0 = 0;
t = -1;

ka = zeros(1, n);
for i = 1:n
    ka(i) = 2*pi*i/n;
end

E1 = zeros(1,n);
E2 = zeros(1,n);
for i = 1:n
    E1(i) = sqrt(2*t^2 + 2*t^2*cos(ka(i)));
    E2(i) = -1*sqrt(2*t^2 + 2*t^2*cos(ka(i)));
end

E = [E1, E2];
ka = [ka, ka];

scatter([ka/pi - 2, ka/pi], [E,E], 50, 'filled', 'b')
grid on

% H = zeros(n,n);
% for i = 1:n
%     for j = 1:n
%         if i == j
%             H(i,j) = epsilon_0;
%         elseif i+1 == j || j+1 == i...
%                 || (i==n && j==1) || (j==n && i==1)
%             H(i,j) = t;
%         end
%     end
% end


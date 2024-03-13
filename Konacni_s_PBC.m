n = 8;

epsilon_0 = 0;
t = -1;

ka = zeros(1, n);
for i = 1:n
    ka(i) = 2*pi*i/n;
end

E = zeros(1,n);
for i = 1:n
    E(i) = 2*t*cos(ka(i));
end

scatter([ka/pi - 2, ka/pi], [E,E], 50, 'filled', 'b')
grid on
hold on
plot([ka/pi - 2, ka/pi], [E,E], 'b')
hold off

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


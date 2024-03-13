n = 3;

epsilon_0 = 0;
t1 = -1;
t2 = -1;
ka = linspace(-pi, pi, 1000);

H_nn = zeros(n,n);
H_nn1 = zeros(n,n);
H_n1n = zeros(n,n);

for i = 1:n
    for j = 1:n
        if i == j
            H_nn(i,j) = epsilon_0;
        elseif i+1 == j || j+1 == i 
            H_nn(i,j) = t1;
        elseif i>j && i ~= j || i<j && i ~= j
            H_nn(i,j) = t2;
        end
    end
end

% %desni susjed
% H_nn1(n,1) = t2;
% 
% %lijevi susjed
% H_n1n(1,n) = t2;

%desni susjed
for i = 1:n
    for j = 1:n
        if i<j && i ~= j
            H_nn1(i,j) = t2;
        end
    end
end

%lijevi susjed
for i = 1:n
    for j = 1:n
        if i>j && i ~= j
            H_n1n(i,j) = t2;
        end
    end
end

E_k = [];
for k = 1:length(ka)
        H_k = H_nn + H_nn1.*exp(1i*ka(k)) + H_n1n.*exp(-1i*ka(k));
        eigs = eig(H_k);
        for i = 1:n
            E_k = [E_k, eigs(i)];
        end
end

ka_2 = linspace(-pi, pi, n*1000);
scatter(ka_2/pi, E_k,3);






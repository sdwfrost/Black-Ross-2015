% SIR model. 
% Calcualte the final size distribution, NOT the full p vector.

N = 100;                       
beta = 2/(N-1);
gamma = 1;

q = zeros(N+1,1);
q(2) = 1;

for Z2 = 0:N;
   
    for Z1 = Z2+1:N-1
        
         p1 = 1 / ( 1 + gamma/(beta*(N-Z1)));
         
         q(Z1+2) = q(Z1+2) + q(Z1+1)*p1;       
         q(Z1+1) = q(Z1+1)*(1-p1);

    end

end

bar(0:N,q)
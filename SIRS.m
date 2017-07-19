% Compute the total number of infections in an SIRS model.

N = 30; 
beta = 3/(N-1);
gamma = 1;
mu = 0.1;

Lambda = 60;
Psi = (N+1)*(N+2)/2;

final_size = zeros(Lambda+1,1);

q_vec = zeros(Psi,1);
h_vec = zeros(Psi,1);

q_vec(2) = 1;

for Z3=0:Lambda
    
    w = 1;
    
    for Z2 = 0:N
                
        a3 = mu*Z2;
        for Z1 = Z2:N
                        
            a1 = beta*(N-Z1)*(Z1-Z2);
            a2 = gamma*(Z1-Z2);
            tot = a1+a2+a3;

            if a1>0
                q_vec(w+1) = q_vec(w+1) + q_vec(w) *  a1/tot;
            end

            if a2>0
                q_vec(w+N-Z2) = q_vec(w+N-Z2) + q_vec(w)*a2/tot;
            end
            
            if a3>0  
                h_vec(w-N+Z2-2) = q_vec(w) * a3/tot;
            end
            
            w = w + 1;          
        end
 
    end
    
    final_size(Z3+1) = q_vec(1);
    q_vec = h_vec;
    h_vec = zeros(Psi,1);
    
end

prob_left = sum(q_vec);
bar(0:Lambda+1,[final_size; prob_left])
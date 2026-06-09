clear all;
clc;
n=input('Banyaknya titik pada graf modulo :');
U = zeros(n);
for i = 1:n
        for j = 1:n
            if abs(i - j) > 1 
                if mod(i + j, 2) == 0
                    U(i, j) = 1;
                end
            end
        end
end
disp('matriks adjacency =')
disp(U)

m=n/2;

if n>=6 && mod(n,2)==0
   A = eye(m);
   for i=1:m-2
       A(i+2,i)=1;
   end

   B = zeros(m);
   B(1, m-1) = 1;
   B(2, m) = 1;

   C = eye(m);

   D = eye(m);
   for i = 5:m
        D(i, i - 4) = 1;
   end
    
   if n==6
       matriks_insiden = [A B;B A]
    
   elseif n==8
       matriks_insiden = [A B C;B A C]
    
   elseif n==10
          E = zeros(m);  
          for i = 1: min(4,m) 
              for i = 1:min(4,m) 
                  E(i, m-4+i) = 1; 
              end
          end 
       matriks_insiden = [A B D E;B A E D]
    
   elseif n==12
          E = zeros(m);  
          for i = 1: min(4,m) 
              for i = 1:min(4,m) 
                  E(i, m-4+i) = 1; 
              end
          end 
       matriks_insiden = [A B D E C;B A E D C]
   end
else 
    disp('Masukkan bilangan bulat genap 6 atau 8 atau 10 atau 12')
end
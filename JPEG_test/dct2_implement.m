A(1:8,1)= 150;
A(1:8,2)= 100;
A(1:8,3)= 256;
A(1:8,4)= 200;
A(1:8,5)= 120;
A(1:8,6)= 80;
A(1:8,7)= 10;
A(1:8,8)= 220;
u = 3;
v = 3;



for i=1:8
    for j=1:8
        tmp = 0;
        for k = 1:8
            for l = 1:8                          
                tmp = tmp + A(k,l)*cos((2*k-1)*(i-1)*pi/16)*cos((2*l-1)*(j-1)*pi/16); 
            end
        end
        
        if (i-1) == 0 
            au = sqrt(1/8);
        else
            au = sqrt(1/4);
        end
        if (j-1) == 0;
            av = sqrt(1/8);
        else
            av = sqrt(2/8);
        end   
        B(i,j) = au*av*tmp;
    end
end

for i=1:8 %x
    for j=1:8 %y
        tmp = 0;
        for k = 1:8 %u
            for l = 1:8 %v  
                if (k-1) == 0 
                    au = sqrt(1/8);
                else
                    au = sqrt(2/8);
                end
                if (l-1) == 0;
                    av = sqrt(1/8);
                else
                    av = sqrt(2/8);
                end   
                tmp = tmp + au*av*B(k,l)*cos((2*i-1)*(k-1)*pi/16)*cos((2*j-1)*(l-1)*pi/16); 
            end
        end        
        
        invB(i,j) =tmp;
    end
end

B,invB,C = dct2(A),D = idct2(C)

q_mat = [16 11 10 16 24 40 51 61; 
    12 12 14 19 26 58 60 55;
    14 13 16 24 40 57 69 56;
    14 17 22 29 51 87 80 62;
    18 22 37 56 68 109 103 77; 
    24 35 55 64 81 104 113 92; 
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99];

for i = 1:8
    for j = 1:8
        qB(i,j) = floor(B(i,j)/q_mat(i,j));
        
       if qB(i,j) == -1
           qB(i,j) = 0;
       end
    end
end

for i = 1:8
    for j = 1:8
        invqB(i,j) = qB(i,j)*q_mat(i,j);     
    end
end

qB
for i=1:8 %x
    for j=1:8 %y
        tmp = 0;
        for k = 1:8 %u
            for l = 1:8 %v  
                if (k-1) == 0 
                    au = sqrt(1/8);
                else
                    au = sqrt(2/8);
                end
                if (l-1) == 0;
                    av = sqrt(1/8);
                else
                    av = sqrt(2/8);
                end   
                tmp = tmp + au*av*invqB(k,l)*cos((2*i-1)*(k-1)*pi/16)*cos((2*j-1)*(l-1)*pi/16); 
            end
        end        
        
        invB_qb(i,j) =tmp;
    end
end

invB_qb
idct2(invqB)








































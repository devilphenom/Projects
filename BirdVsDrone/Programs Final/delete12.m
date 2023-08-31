p = zeros(NumberOfFiles,1);
class1 = 1;
class2 = 100;
for i = 1 : NumberOfFiles    
    for j = 1 : 100
        if (rankMatrix(i,j)>= class1 && rankMatrix(i,j) <= class2)
            p(i) = p(i)+ 1;
        end
    end
    if(mod(i,100) == 0)
            class1 = class2 + 1;
            class2 = class2 + 100;          
        end    
end


k = 1;
s = zeros(5,1);
for i = 1 : 500
    s(k) = s(k) + p(i);
    if(mod(i,100)==0)
        s(k) = s(k)/100;
        k = k + 1;
        sum = 0;        
    end    
end

disp(s);
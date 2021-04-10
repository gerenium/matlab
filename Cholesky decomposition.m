function z=Cholesky ;
a=[-7, -5, -9, 4; -5, -4, 5, 3; -9, 5, 1, 7; 1, 3, 7, -10];
f=[-67, -18, 13, 122]';
n=4; %размерность матрицы
s2s=0;
p=0;
 
d(1,1)=sign(a(1,1));
s(1,1)=sqrt(abs(a(1,1)));
 
for i=2:n
    s(1,i)=a(1,i)/s(1,1)/d(1,1);
end
 
for i=2:n
    for k=1:(i-1)
        s2s=s2s+s(k,i)^2*d(k,k);
    end;
    
    d(i,i)=sign(a(1,1)-s2s);
    s(i,i)=sqrt(abs(a(i,i)-s2s));
 
  s2s=0;    
     for p=(i-1):n
         if p>i
          for k=1:(i-1)
              s2s=s2s+s(k,i)*s(k,p)*d(k,k);
          end;
          
          s(i,p)=(a(i,p)-s2s)/s(i,i)/d(i,i);
          s2s=0;
         end;
     end;
end;
 
%обратный ход
s1s=0; 
   y(1)=f(1)/s(1,1);
   
     for i=2:n
         for k=1:(i-1)
             s1s=s1s+s(k,i)*y(k);
         end;
         
         y(i)=(f(i)-s1s)/s(i,i);
         s1s=0;
     end;
     
     
     s1s=0;
     x(n)=d(n,n)*y(n)/s(n,n);
     
 i=n-1;
     %for i=(n-1):1
       while i>=1
           for k=(i+1):n
               s1s=s1s+s(i,k)*x(k);
           end;
           
           x(i)=(d(i,i)*y(i)-s1s)/s(i,i);
           s1s=0;
           i=i-1;
       end;
 
w=s'*d*s;
 
disp('исходная матрица');
disp(a)
disp('матрица S"*D*S');
disp(w);
disp('Ответ. x=');
disp(x);

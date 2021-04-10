function z=Jacobi;
A=[-7, -5, -9, 4; -5, -4, 5, 3; -9 5, 1, 7; 4, 3, 7, -10];
A1=A;
B=[-67; -18; 13; 122];
N=4;
k=0;
eps=0.00001;
 
Amax=1;
while Amax>eps
 Amax=0;   
   for i=1:N
       for j=1:N
          if i<j 
           if Amax<abs(A(i,j)) 
               Amax=abs(A(i,j));
               p=i;  
               q=j;
           end;
          end;
       end;
   end;
 k=k+1;
 
 
U=diag(diag(ones(N)));
 
 if A(p,p)==A(q,q)
     fi=pi/4;
 else
     fi=atan(2*A(p,q)/(A(p,p)-A(q,q)))/2;
 end;
 
 U(p,p)=cos(fi);
 U(p,q)=-sin(fi);
 U(q,p)=sin(fi);
 U(q,q)=cos(fi);
 
 U1=U;             %собственных векторов
  if k~=1
      U2=U2*U1;
  else
      U2=U1;
  end;
      
 A=U'*A*U; 
end;
disp('количество итераций');
disp(k);
disp('собственные значения');
disp(A);
disp('собственные вектора');
disp(U2);
D=U2*A*inv(U2);
disp('проверка. М=U*A*U^(-1), где U-матрица собственнных векторов, A-матрица собственных значений');
disp(D);

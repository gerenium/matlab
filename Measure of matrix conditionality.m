function z = Measure;
N=4;
XX=[1,1,0,0]';
x1=[1:N]';
x2=[1:N]';
v=[0,0,0,0]; %матрица полученных значений из метода Гаусса
A=[-3, 6, -10, -6; 6, -9, 0, -2; -10, 0, -10, -7; -6, -2, -7, 4];
eps=0.000001;
k=0;
n=0;
%начало кода
x1=A*XX/sqrt(XX(1)*XX(1)+XX(2)*XX(2)*XX(3)*XX(3)+XX(4)*XX(4));
x2=A*x1/sqrt(x1(1)*x1(1)+x1(2)*x1(2)+x1(3)*x1(3)+x1(4)*x1(4));
x3=x2-sign(x2(1)*x1(1))*x1;
 while sqrt(x3(1)*x3(1)+x3(2)*x3(2)+x3(3)*x3(3)+x3(4)*x3(4))>eps;
     x1=A*x2/sqrt(x2(1)*x2(1)+x2(2)*x2(2)+x2(3)*x2(3)+x2(4)*x2(4));
     x2=A*x1/sqrt(x1(1)*x1(1)+x1(2)*x1(2)+x1(3)*x1(3)+x1(4)*x1(4));
     x3=x2-sign(x2(1)*x1(1))*x1;
     k=k+1;
 end;
 
 L1=x2(1)*sqrt(x1(1)*x1(1)+x1(2)*x1(2)+x1(3)*x1(3)+x1(4)*x1(4))/x1(1);
 Anorm=sqrt(L1*L1);
 
%окончание нахождения собственного значения прямой матрицы
 
b=XX/sqrt(XX(1)*XX(1)+XX(2)*XX(2)*XX(3)*XX(3)+XX(4)*XX(4));
C=[A,b];
for i=1:N
  amax=C(i,i);
  imax=i;
  for j=(i+1):N
    if abs(C(j,i))>abs(amax)
      amax=C(j,i);
      imax=j;  
    end; 
  end;  
  for j=i:(N+1)
    h=C(i,j);
    C(i,j)=C(imax,j);
    C(imax,j)=h;
  end; 
  h=C(i,i); 
  for j=i:(N+1)
    C(i,j)=C(i,j)/h;   
  end;  
  for k=i+1:N
    h=C(k,i); 
    for j=i:N+1
      C(k,j)=C(k,j)-C(i,j)*h;  
    end;
  end;  
end;
  % обратный ход
v(N)=C(N,N+1);  
for i=1:(N-1)
  i1=N-i;  
  sum=0;  
  for j=(i1+1):N
    sum=sum+v(j)*C(i1,j);  
  end;    
  v(i1)=C(i1,N+1)-sum;
end;   
  x1=v';
 
 
b=x1/sqrt(x1(1)*x1(1)+x1(2)*x1(2)+x1(3)*x1(3)+x1(4)*x1(4))/x1(1);
C=[A,b];
for i=1:N
  amax=C(i,i);
  imax=i;
  for j=(i+1):N
    if abs(C(j,i))>abs(amax)
      amax=C(j,i);
      imax=j;  
    end; 
  end;  
  for j=i:(N+1)
    h=C(i,j);
    C(i,j)=C(imax,j);
    C(imax,j)=h;
  end; 
  h=C(i,i); 
  for j=i:(N+1)
    C(i,j)=C(i,j)/h;   
  end;  
  for k=i+1:N
    h=C(k,i); 
    for j=i:N+1
      C(k,j)=C(k,j)-C(i,j)*h;  
    end;
  end;  
end;
  % обратный ход
v(N)=C(N,N+1);  
for i=1:(N-1)
  i1=N-i;  
  sum=0;  
  for j=(i1+1):N
    sum=sum+v(j)*C(i1,j);  
  end;    
  v(i1)=C(i1,N+1)-sum;
end;   
  x2=v';
  
  
x3=x2-sign(x2(1)*x1(1))*x1;
 while sqrt(x3(1)*x3(1)+x3(2)*x3(2)+x3(3)*x3(3)+x3(4)*x3(4))>eps;
     b=x2/sqrt(x2(1)*x2(1)+x2(2)*x2(2)+x2(3)*x2(3)+x2(4)*x2(4));
     C=[A,b];
     for i=1:N
  amax=C(i,i);
  imax=i;
  for j=(i+1):N
    if abs(C(j,i))>abs(amax)
      amax=C(j,i);
      imax=j;  
    end; 
  end;  
  for j=i:(N+1)
    h=C(i,j);
    C(i,j)=C(imax,j);
    C(imax,j)=h;
  end; 
  h=C(i,i); 
  for j=i:(N+1)
    C(i,j)=C(i,j)/h;   
  end;  
  for k=i+1:N
    h=C(k,i); 
    for j=i:N+1
      C(k,j)=C(k,j)-C(i,j)*h;  
    end;
  end;  
end;
  % обратный ход
v(N)=C(N,N+1);  
for i=1:(N-1)
  i1=N-i;  
  sum=0;  
  for j=(i1+1):N
    sum=sum+v(j)*C(i1,j);  
  end;    
  v(i1)=C(i1,N+1)-sum;
end;
    x1=v';
    
    
    b=x1/sqrt(x1(1)*x1(1)+x1(2)*x1(2)+x1(3)*x1(3)+x1(4)*x1(4));
    C=[A,b];
       for i=1:N
  amax=C(i,i);
  imax=i;
  for j=(i+1):N
    if abs(C(j,i))>abs(amax)
      amax=C(j,i);
      imax=j;  
    end; 
  end;  
  for j=i:(N+1)
    h=C(i,j);
    C(i,j)=C(imax,j);
    C(imax,j)=h;
  end; 
  h=C(i,i); 
  for j=i:(N+1)
    C(i,j)=C(i,j)/h;   
  end;  
  for k=i+1:N
    h=C(k,i); 
    for j=i:N+1
      C(k,j)=C(k,j)-C(i,j)*h;  
    end;
  end;  
end;
  % обратный ход
v(N)=C(N,N+1);  
for i=1:(N-1)
  i1=N-i;  
  sum=0;  
  for j=(i1+1):N
    sum=sum+v(j)*C(i1,j);  
  end;    
  v(i1)=C(i1,N+1)-sum;
end;
     x2=v';
     
     
     x3=x2-sign(x2(1)*x1(1))*x1;
     k=k+1;
 end;
  
 
 
 
 
 L2=x2(1)*sqrt(x1(1)*x1(1)+x1(2)*x1(2)+x1(3)*x1(3)+x1(4)*x1(4))/x1(1);
 A1norm=sqrt(L2*L2);
 
 
 U=Anorm*A1norm;
 
 
 
 disp('мера обусловленности матрицы в результате работы команды cond(А)');
 R=cond(A);
 disp(R);
 disp('мера обусловленности матрицы в результате работы программы');
 
z=U;

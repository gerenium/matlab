function z = th;
N=1024;
v=ones(N,1);
C=rand(N);
J=[1:N]';
P=C*J;
C=[C,P];
 
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
z=v;

function z=progonka;
A=[1, -3, 0, 0; 0, 2, -4, 0; 0, -6, -2, 4; 0, 0, 7,1];
b=[39, -4, 96, -21]';
N=4;
a1=-A(1,2);
b1=b(1);
m(1)=a1;
n(1)=b1;
v=zeros(1,N);
k=4;
 
 for i=1:N-2;
     a2=a1;
     a1=-A(i+1,i+2)/(A(i+1,i)*a1+A(i+1,i+1));
     b1=(b(i+1)-A(i+1,i)*b1)/(A(i+1,i)*a2+A(i+1,i+1));
     m(i+1)=a1;
     n(i+1)=b1;
 end;
 
 %обратный ход
 yn=(-A(N,N-1)*b1+b(N))/(1+A(N,N-1)*a1);
 v(N)=yn;
  while k>1
      k=k-1;
      v(k)=m(k)*v(k+1)+n(k); 
  end;
  disp(v);
      

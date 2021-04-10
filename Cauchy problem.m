function z = Cauchy(x1, x2, t);
a=1;
b=3;
n=10;
h=(b-a)/n;
x1=2; 
x2=0;
t=a;
 
  
disp(sprintf('     x                      u1 ан              u1 числ              u2 ан             u1 числ'));
 
for i=1:n+1
     u(1)=t;
     u(2)=z1(t);
     u(4)=z2(t);
     u(3)=x1;
     u(5)=x2;
    
     k11=h*y1(t, x2);
     k12=h*y2(t, x1);
     
     k21=h*y1((t+h/2),(x2+k12/2));
     k22=h*y2(t+h/2, x1+k11/2);
     
     k31=h*y1(t+h/2, x2+k22/2);
     k32=h*y2(t+h/2, x1+k21/2);
     
     k41=h*y1(t+h, x2+k32);
     k42=h*y2(t+h, x1+k31);
     
     x1=x1+(k11+2*k21+2*k31+k41)/6;
     x2=x2+(k12+2*k22+2*k32+k42)/6;
     t=t+h;
    
     disp(u);
 end;
 
function z = y1(t, x2);
z=-x2/t;
function z = y2(t, x1);
z = -x1/t;
function z = z1(t);
z=t+1/t;
function z = z2(t);
z=-t+1/t;

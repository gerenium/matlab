function z= integration(x);
a=0;
b=1;
eps=0.0000001;
I1=0;
I=1;
n=8;
k=0;
 
h=(b-a)/n;
an=pi/8;
 
while abs(I-I1)/3>eps
    s=0;
    x=a+h/2; 
 for i=1:n
      f(i)=y(x);
      x=x+h;
      s=s+f(i);
 end;
    I=h*s;
 
    
s=0;
k=k+1;
n=n*2;
h=(b-a)/n;
x=a+h/2; 
    for i=1:n
        f(i)=y(x);
        x=x+h;
        s=s+f(i);
    end;
 
   I1=h*s;
 end;
 
 
disp('МЕТОД ПРЯМОУГОЛЬНИКОВ');
disp('предпоследняя итерация');
disp(I);
disp('последняя итерация');
disp(I1);
disp('аналитическое решение');
disp(an);
disp('количество итераций');
disp(k);
disp('число разбиений');
disp(n);
disp('-------------------------------');
 
 
 
I=1;
I2=0;
k=0;
n=8;
h=(b-a)/n;
 
 while abs(I-I2)/3>eps
     x=a;
     s=0;
    for i=1:n+1
        f(i)=y(x);
        x=x+h;
          if (i==1)|(i==(n+1))
              p=2;
          else
              p=1;
          end
        s=s+f(i)/p;
    end;
 
   I=h*s;
 
 
 s=0;
 x=a;
 k=k+1;
 n=n*2;
 h=(b-a)/n;
    for i=1:n+1
        f(i)=y(x);
        x=x+h;
          if (i==1)|(i==(n+1))
              p=2;
          else
              p=1;
          end
        s=s+f(i)/p;
    end;
 
   I2=h*s;
 end;
  
 disp('МЕТОД ТРАПЕЦИЙ');
 disp('предпоследняя итерация');
 disp(I);
 disp('последняя итерация');
 disp(I2);
 disp('аналитическое решение');
disp(an);
 disp('количество итераций');
 disp(k);
 disp('число разбиений');
disp(n);
 disp('-------------------------------');
 
 
 
 
I=10;
I3=0;
k=0;
n=8;
h=(b-a)/2/n; 
 
 
 while abs(I-I3)/15>eps
     x=a;
     s=0;
   for i=1:n+1
     f(i)=y(x);
     x=x+h;
      if (i==1)|(i==n+1)
          p=1;
      else
         if mod(i,2)==0
             p=4;
         else 
             p=2;
         end;
      end;
     s=s+p*f(i);
   end;
    
 I=h*s/3;
 
 
 
 s=0;
 x=a;
 k=k+1;
 n=n*2;
 h=(b-a)/n;
 
 for i=1:n+1
     f(i)=y(x);
     x=x+h;
      if (i==1)|(i==n+1)
          p=1;
      else
         if mod(i,2)==0
             p=4;
         else 
             p=2;
         end;   
      end;
     s=s+p*f(i);
   end;
    
 I3=h*s/3;
  end;
  
  
  
  disp('МЕТОД СИМПСОНА');
 disp('предпоследняя итерация');
 disp(I);
 disp('последняя итерация');
 disp(I3);
 disp('аналитическое решение');
disp(an);
 disp('количество итераций');
 disp(k);
 disp('число разбиений');
disp(n);
 disp('-------------------------------');

function z = y(x);
z=x/(1+x^4);

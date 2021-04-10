function [] = mnk()
clear
hold on
n=10;
 
% Линейная функция
  m=1;
  [x,y]=f_tab1();
for p=1:m+1
    for q=1:m+1
        b(p,q)=0;
        for i=1:(n+1)
            b(p,q)=b(p,q)+x(i)^(p+q-2);
        end
    end
end
 
for p=1:m+1
    c(p)=0;
    for i=1:(n+1)
        c(p)=c(p)+y(i)*(x(i)^(p-1));
    end
end
   x=x';
   y=y';
   c=c';
   plot(x,y,'-k');
 
a=f_m_Gaussa(b,c);
fi=a(1)+a(2)*x;
plot(x,fi,'-bo');
 
Rez=ones(11,8);
Rez(:,1)=x;
Rez(:,2)=y;
Rez(:,3)=fi;
for i=1:(n+1)
  nev1(i)=(fi(i)-y(i))^2;
end
Rez(:,6)=nev1;
 
% Парабола
  m=2;
  [x,y]=f_tab1();
  
for p=1:m+1
    for q=1:m+1
        b(p,q)=0;
        for i=1:(n+1)
            b(p,q)=b(p,q)+x(i)^(p+q-2);
        end
    end
end
 
for p=1:m+1
    c(p)=0;
    for i=1:(n+1)
        c(p)=c(p)+y(i)*(x(i)^(p-1));
    end
    
end
x=x';
y=y';
 
a=f_m_Gaussa(b,c);
for i=1:(n+1)
    fi2(i)=a(1)+a(2)*x(i)+a(3)*(x(i)^2);
end
 
for i=1:(n+1)
    nev2(i)=(fi2(i)-y(i))^2;
end
 
plot(x,fi2,'-go');
Rez(:,4)=fi2;
Rez(:,7)=nev2;
 
% Многочлен 3 степени
  m=3;
  [x,y]=f_tab1();
for p=1:m+1
    for q=1:m+1
        b(p,q)=0;
        for i=1:(n+1)
            b(p,q)=b(p,q)+x(i)^(p+q-2);
        end
    end
end
 
for p=1:m+1
    c(p)=0;
    for i=1:(n+1)
        c(p)=c(p)+y(i)*(x(i)^(p-1));
    end
    
end
x=x';
y=y';
 
a=f_m_Gaussa(b,c);
for i=1:(n+1)
    fi3(i)=a(1)+a(2)*x(i)+a(3)*(x(i)^2)+a(4)*(x(i)^3);
end
 
for i=1:(n+1)
    nev3(i)=(fi3(i)-y(i))^2;
end
plot(x,fi3,'-ro');
 
Rez(:,5)=fi3;
Rez(:,8)=nev3;
 
 
%квардратов невязок
sum1=0;
 for i=1:10
     sum1=sum1+Rez(i,6)*Rez(i,6);
 end;
 
sum2=0;
  for i=1:10
      sum2=sum2+Rez(i,7)*Rez(i,7);
  end;
  
sum3=0;
    for i=1:10
        sum3=sum3+Rez(i,8)*Rez(i,8);
    end;
 
 
disp(Rez)
legend('sqrt(2x+3)+sin(3*x+pi/3)','линейная','параболическая','кубическая');
grid on;
 
disp('                       сумма квадратов невязок');
disp(sum1);
disp(sum2);
disp(sum3);
end

function [x y] = f_tab1()
n = 10;
a = 1;
b = 6;
h=(b-a)/n;
 
for i=1:(n+1)
    x(i)=a+(i-1)*h;
    y(i)= sqrt(9*x(i)-2)+sin(3*x(i)+pi/3);
end
 
end
function x = f_m_Gaussa(b,c)
% a - расширенная матрица
% k - шаги метода Гаусса
 
n=length(c);
 
for i=1:n
    a(i,n+1)=c(i);
    for j=1:n
        a(i,j)=b(i,j);
    end;
end
 
% Прямой ход метода Гаусса
for i=1:n
    a_max=a(i,i);
    i_max=i;
    for l=(i+1):n
        if abs(a(l,i))>abs(a_max)
           a_max=a(l,i);
           i_max=l;  
        end; 
    end;
    
    for j=i:(n+1)
        r=a(i,j);
        a(i,j)=a(i_max,j);
        a(i_max,j)=r;
    end;
    
    r=a(i,i); 
    for j=i:(n+1)
        a(i,j)=a(i,j)/r;   
    end;  
    
    for l=i+1:n
        r=a(l,i); 
        for j=i:n+1
            a(l,j)=a(l,j)-a(i,j)*r;  
        end;
    end;
    
end;
 
% Обратный ход метода Гаусса
x(n)=a(n,n+1);  
for i=1:(n-1)
    n_i=n-i;  
    sum=0;  
    for j=(n_i+1):n
        sum=sum+x(j)*a(n_i,j);  
    end;    
    x(n_i)=a(n_i,n+1)-sum;
end
end

N = 10;
a = 1;   
b = 6;   
 
res= containers.Map;
res('X') = reshape((b - a) / 5 / 2 + a: (b - a) / 5 : b, [], 1);
res('Y') = fun(res('X'));
 
 
    h = (b - a) / N;
    xv = a:h:b;
    yv = fun(xv);
 
   [av, bv, cv, dv] = coeff(yv, h);
 
    dense_xv = a:0.005:b;
    appr_yv = spl_approx(dense_xv, av, bv, cv, dv, xv);
    real_yv = fun(dense_xv);
 
   
 
    plot(xv, yv, 'ob',...
        dense_xv, real_yv, '-.r',...
        dense_xv, appr_yv, '-k');
    title('сплайн интерполяция');
    xlabel('x'); ylabel('y');
    legend('узлы','функция', 'кубический сплайн',4)
 
  
    middle_xv = h / 2 + xv(1:end-1);  
    middle_true_yv = fun(middle_xv);
    middle_appr_yv = spl_approx(middle_xv, av, bv, cv, dv, xv);
    
 
 
    disp('            x             y аналит            у сплайн');
    disp([middle_xv', middle_true_yv', middle_appr_yv']);


function yv = spline_approximation(x_points, av, bv, cv, dv, xv)
  [~, N] = size(av);
  [X, Y] = size(x_points);
  yv = zeros(X, Y);
  for row = 1:X
      for col = 1:Y
          x = x_points(row, col);
          for i = 1:N
              if x <= xv(i + 1)
                  yv(row, col) = interval(x, av(i), bv(i), cv(i), dv(i), xv(i));
                  break;
              end
          end
      end
  end


function [av, bv, cv, dv] = coef(yv, h)
 
  [M, N] = size(yv);
  N = N - 1;
 
  assert(M == 1);
  A = zeros(N + 1);
  b = zeros(N + 1, 1);
  for i = 1:N + 1
      if i == 1
         
          b(i) = 0;
          A(i, i) = 1;
      elseif i == N + 1
          
          b(i) = 0;
          A(i, i) = 1;
      else
          A(i, i - 1) = h / 3;
          A(i, i) = 4 * h / 3;
          A(i, i + 1) = h / 3;
          b(i) = (yv(i + 1) - 2 * yv(i) + yv(i - 1)) / h;
      end
  end
  cv = linsolve(A, b);
  cv = reshape(cv(1:end - 1), 1, []);
  av = zeros(1, N);
  bv = zeros(1, N);
  dv = zeros(1, N);
  for i = 1:N
     
      av(i) = yv(i);
      if i ~= N
          dv(i) = (cv(i + 1) - cv(i)) / (3 * h);
      else
          dv(N) = -cv(N) / 3 * h;
      end
      bv(i) = (yv(i + 1) - yv(i)) / h - cv(i) * h - dv(i) * (h^2);
  end
end


function y = fun(x)
y = sqrt(9*x-2)+sin(3*x+pi/3);


function y = interval(x, a, b, c, d, xi)
  y = a + b * (x - xi) + c * ((x - xi)^2) + d * ((x - xi)^3);
end


function yv = spl_approx(x_points, av, bv, cv, dv, xv)
  [~, N] = size(av);
  [X, Y] = size(x_points);
  yv = zeros(X, Y);
  for row = 1:X
      for col = 1:Y
          x = x_points(row, col);
          for i = 1:N
              if x <= xv(i + 1)
                  yv(row, col) = interval(x, av(i), bv(i), cv(i), dv(i), xv(i));
                  break;
              end
          end
      end
  end

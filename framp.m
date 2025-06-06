function f = framp(t)

N = 50;
A = 4e-5; % m2
T = 100; % us
I = 0.5; % A

f=N*abs(I*sin(pi*t/T))/A;
f(t > 100) = 0;
end



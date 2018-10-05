Ts = 0.1;
fs=1/Ts;    %samples per/second
Trange = [-15:Ts:15];
s1 = exp(-0.1*Trange.^2);
s2 = exp(-0.1*Trange.^2).*cos(Trange);
E1 = sum(abs(s1.^2));
E2 = sum(abs(s2.^2));
s1 = s1/sqrt(E1);
s2 = s2/sqrt(E2);
sigma=1;
w=sigma.*randn(1,301);
x1=s1+w;
x2=s2+w;
Tau=Ts/3;
T=[-5:Tau:5];



%%
close all
stem(Trange/Ts,s1)
title('s1')
grid on
%%%%%%%%%%%%%%%%%%%%%%%5
figure
stem(Trange/Ts,s2)
grid on
title('s2')
%%%%%%%%%%%%%%%%%%%%%%%%
figure
stem(Trange/Ts,x1)
grid on
title('x1 - sampled')
figure
stem(Trange/Ts,x2)
grid on
title ('x2 - sampled')

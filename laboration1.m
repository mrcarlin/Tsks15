%% Get started code

close all
Ts=0.1; 
T_delay=[1]; % need to assume a delay?
Trange=[-15:Ts:15];
s1=exp(-0.1*(Trange).^2);
s2=exp(-0.1*(Trange).^2).*cos(Trange);
tau=0.1;          %sample frequency
sigma=1;         %variance
w=sigma.*randn(1,301);  %random vector with values drawn from a standard normal distribution
mean_w=mean(w);  %mean value of w
std_w=std(w);    %Standard deviation of w
var_w=var(w);    %Variance of w
x1=s1+w;
x2=s2+w;
alpha1=sqrt(1/(sum((s1).^2)));  %alpha1=0.1588
alpha2=sqrt(1/sum((s2.^2)));     %alpha2=0.2239
s1_alpha=alpha1*s1;
s2_alpha=alpha2*s2;

%E1=sum(abs(s1.^2));
%E2=sum(abs(s2.^2));
%s1=s1/sqrt(E1);
%s2=s2/sqrt(E2);
%%
close all
stem(Trange/Ts,s1_alpha)
title('s1')
grid on
%%%%%%%%%%%%%%%%%%%%%%%5
figure
stem(Trange/Ts,s2_alpha)
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
true_t=0; % Tml true
t2=0; % Tml guess
T=[-5:Ts/3:5];
s1_alphadelay=s1_alpha.*exp(-0.1.*(Trange-T).^2);
Mls1=sum(x1.*s1);
s1_t1=max(sum(x1.*(s1_alpha.*(exp(-0.1.*(Trange-T).^2))))); %
%s2_t2=max(sum(x2.*(s2_alpha.*exp(-0.1.*(Trange-t1).^2).*cos(Trange-t1))));
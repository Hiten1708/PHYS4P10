%%  expo_maketest.m
%    make f(t) + noise, for testing TR analysis of 
%    a distribution of relaxation rates, g(r) 
%
%  Completed: Dec.2005, Edward Sternin <edward dot sternin at brocku dot ca>
%  Contributions: Hartmut Schaefer
%  Revisions: 2018.02 ES converted to matlab/octave from SciLab
%
clear;

noise=0.05;     % noise as fraction of the max(f(t))
datafile=sprintf("noisy-%.2f.dat",noise);

t_steps=1000;   % t-domain signal has this many points,
t_min=1;        %  from this minimum,
t_max=1e5;      %  to this maximum
r_steps=500;    % r-grid has this many points,
r_min=1/t_max;  %  from this minimum,
r_max=1/t_min;  %  to this maximum

% Use an array of Gaussian peaks that make up the true g(r):
%peaks = [[0.5 0.20 0.04];[0.65 0.50 0.03];[0.75 0.80 0.03]];    % [amplitude center width]
peaks = [[0.5 0.20 0.04];[0.65 0.50 0.03]];   % [amplitude center width]
%peaks = [[0.6 0.35 0.1];[0.1 0.45 0.15]];    % [amplitude center width]

%  create a vector of r values, logarithmically spaced
r_scale = log(r_max)-log(r_min);
r = exp([log(r_min):r_scale/(r_steps-1):log(r_max)])'; % use a column vector

%  build up g(r) by adding Gaussian contributions from all peaks
g = zeros(length(r),1);
for k=1:length(peaks(:,1))
  r0 = log(r_min) +  r_scale*peaks(k,2);
  dr = r_scale*peaks(k,3);
  g += peaks(k,1) * exp (- (log(r) - r0).^2 / (2 * dr^2));
end

f1=figure(1); clf(1);
semilogx(r,g,'r-','LineWidth',2);
ylabel("g(r)");
xlabel("r");
title("Test distribution of relaxation rates");    % a bug: for svg graphics MUST have a title defined
FS = findall(f1,'-property','FontSize');
set(FS,'FontSize',14);
%print -dpng g.png

%  create a vector of t values, linearly spaced; use column vectors for f(t)
t = [t_min:(t_max-t_min)/(t_steps-1):t_max]';

%  generate time-domain data
f = (1/(length(t)-1)*g'*exp(-r*t'))';

%  normalize and add random noise
f /= max(f);
f += noise*(-0.5+rand(length(f),1));

f2=figure(2); clf(2);
plot(t,f,'g-');
%semilogy(t,f,'g-');
ylabel("f(t)");
xlabel("t");
title(sprintf("f(t) + %.1f%% random noise, saved in %s",100*noise,datafile));
FS = findall(f2,'-property','FontSize');
set(FS,'FontSize',14);
%print -dpng f.png

%system(sprintf("rm -rf %s",datafile));
f_of_t=[t f];
save("-ascii",datafile,"f_of_t");

g_of_r=[r g];
save("-ascii","true_g.dat","g_of_r");

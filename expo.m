%% expo.m
%  multi-exponential inverse analysis of time decay curves
%    f(t) = \int g(r) exp(-r*t) dr
%
%  Notation:
%    r = vector or r values
%    n = number of points in r
%    g = vector of unknowns, g(r)
%    t = vector of t values
%    m = number of points in t
%    f = vector of measured data, f(t)
%    K = (m x n) kernel matrix
%    svd_cnt = keep only this many singular values
%    lambda = Tikhonov regularization parameter
%    datafile = (noisy) data, in two columns: (t,f)
%
%  Completed: Dec.2005, Edward Sternin <edward dot sternin at brocku dot ca>
%  Contributions: Hartmut Schaefer
%  Revisions: 2018.02 ES converted to matlab/octave from SciLab
%

clear;

function [g] = regularize(t,f,r,K,svd_n,lambda)
  m=length(f);
  n=length(r);
  if (m < n) 
    error ("This code is not meant for underdetermined problems, need more data");
  end

  %  SVD of the kernel matrix
  [U,S,V]=svd(K);

  nt=n;
  %  if requested, truncate the number of singular values
  if (svd_n > 0)
    nt=min(n,svd_n);
    nt=max(nt,2); % but not too few!
  end

  %  Tikhonov regularization
  sl=S(nt,nt);
  for k=1:nt 
    sl(k,k)=S(k,k)/(S(k,k)^2+lambda);
  end

  % return g(r)
  g=V(1:n,1:nt)*sl*U(1:m,1:nt)'*f;  
  
end

%====================================================

datafile='noisy-0.05.dat';
r_steps=70;  % r-grid has this many points,
r_min=1e-6;  % from this minimum,
r_max=1;     % to this maximum
svd_cnt=0;   % set to 0 for no SVD truncation`
lambda=5e-3; % set to 0 for no Tikhonov regularization

%  read in the time-domain data
f_of_t=dlmread(datafile);
t=f_of_t(:,1); % first column is time
f=f_of_t(:,2); % second column is f(t)

%  create a vector of r values, logarithmically spaced
r_inc = (log(r_max)-log(r_min)) / (r_steps-1);
r = exp([log(r_min):r_inc:log(r_max)]);

%  set up our kernel matrix, normalize by the step in r
K = exp(-t*r) * r_inc;

%  call the inversion routine
[g] = regularize(t,f,r,K,svd_cnt,lambda);

%  plot the original data f(t) and our misfit
f1=figure(1); clf(1);
hold on;
plot(t,f,'-'); 

misfit = f - K*g ;
Psi = sum(misfit.^2)/(length(f)-1);
scale=0.2*max(f)/max(misfit);
plot(t,scale*misfit,'-r');

title(sprintf("LS error norm = %f",Psi));
xlabel("t");
ylabel("f(t)");
legend("input data, f(t)",sprintf("misfit, x%.2f",scale));
FS = findall(f1,'-property','FontSize');
set(FS,'FontSize',14);
hold off;

%  separately, plot the result of the inversion
f2=figure(2); clf(2);
hold on;

g_of_r=dlmread("true_g.dat");
r_true=g_of_r(:,1);
g_true=g_of_r(:,2);
r_inc_true=(log(max(r_true))-log(min(r_true)))/(length(r_true)-1);
semilogx(r_true,g_true/(sum(g_true)*r_inc_true),'r:','LineWidth',2);

semilogx(r,g/(sum(g)*r_inc),':o','MarkerSize',2);
title("Pseudo-inverse solution");
xlabel("r");
ylabel("g(r)");
legend("true g(r)",sprintf("%s, SVD=%d, \\lambda=%.2g",datafile,svd_cnt,lambda));
FS = findall(f2,'-property','FontSize');
set(FS,'FontSize',14);
ylim([-0.1 0.8])   % last-minute tweak, to avoid the legend
hold off;

%print -depsc result.eps

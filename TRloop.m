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

%  comment these out if you do not know the "true" g(r)
g_of_r=dlmread("true_g.dat");
r_true=g_of_r(:,1);
g_true=g_of_r(:,2);
r_inc_true=(log(max(r_true))-log(min(r_true)))/(length(r_true)-1);
semilogx(r_true,g_true/(sum(g_true)*r_inc_true),'r-','LineWidth',2);

semilogx(r,g/(sum(g)*r_inc),':o','MarkerSize',2);
title("Pseudo-inverse solution");
xlabel("r");
ylabel("g(r)");
[fdir, fname, fext] = fileparts(datafile);
legend("true {/Italic g(r)}",sprintf("%s%s, SVD=%d, \\lambda=%.3g",fname,fext,svd_cnt,lambda));
%legend(sprintf("%s%s, SVD=%d, \\lambda=%.3g",fname,fext,svd_cnt,lambda));
legend("boxoff");
FS = findall(f2,'-property','FontSize');
set(FS,'FontSize',14);
ylim([-0.1 0.6])   % last-minute tweak, to avoid the legend
hold off;
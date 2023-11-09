clear;

function [g] = regularize(t,f,r,K,svd_n,lambda)
  m=length(f);
  n=length(r);
  if m < n then error("This code is not meant for underdetermined problems, need more data"); end;

  //  SVD of the kernel matrix
  [U,S,V]=svd(K);

  nt=n;
  //  if requested, truncate the number of singular values
  if svd_cnt > 0 then 
    nt=min(n,svd_cnt);
    nt=max(nt,2); // but not too few!
  end;

  //  Tikhonov regularization
  sl=S(nt,nt);
  for k=1:nt 
    sl(k,k)=S(k,k)/(S(k,k)^2+lambda);
  end;

  // return g(r)
  g=V(1:n,1:nt)*sl*U(1:m,1:nt)'*f;  
  
endfunction;


///////////////////////////////////////////////////////////
//  multi-exponential inverse analysis of time decay curves
//    f(t) = \int g(r) exp(-r*t) dr
///////////////////////////////////////////////////////////
//
//  Notation:
//    r = vector or r values
//    n = number of points in r
//    g = vector of unknowns, g(r)
//    t = vector of t values
//    m = number of points in t
//    f = vector of measured data, f(t)
//    K = (m x n) kernel matrix
//    svd_cnt = keep only this many singular values
//    lambda = Tikhonov regularization parameter
//    datafile = (noisy) data, in two columns: (t,f)
///////////////////////////////////////////////////////

datafile='test.dat';
r_steps=50;	// r-grid has this many points,
r_min=1e-4;	//	from this minimum,
r_max=1e0;	//	to this maximum
svd_cnt=11;	// set to 0 for no SVD truncation`
lambda=1e-3;	// set to 0 for no Tikhonov regularization

//  read in the time-domain data
fd=mopen(datafile); [n,t,f]=mfscanf(-1,fd,"%f %f"); mclose(fd);

//  create a vector of r values, logarithmically spaced
r_inc = (log(r_max)-log(r_min)) / (r_steps-1);
r = exp([log(r_min):r_inc:log(r_max)]);

//  set up our kernel matrix, normalize by the step in r
K = exp(-t*r) * r_inc;

//  call the inversion routine
[g] = regularize(t,f,r,K,svd_cnt,lambda);

//  plot the original data f(t) and our misfit
scf(1); clf; plot(t,f,'-'); 
misfit = f - K*g ;
Psi = sum(misfit.^2)/(length(f)-1);
scale=0.2*max(f)/max(misfit);
plot(t,scale*misfit,'-r'); 
legend('input data, f(t)','misfit, x'+string(scale));
xtitle('LS error norm = '+string(Psi),'t','f(t)');

//  separately, plot the result of the inversion
scf(2); clf; plot(log10(r),g,':o');
xtitle('inverse solution','log r','g(r)');



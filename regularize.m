function [g] = regularize(t,f,r,K,svd_n,lambda)
  m=length(f);
  n=length(r);
  if (m < n) 
    error ("This code is not meant for underdetermined problems, need more data");
  end

  %  SVD of the kernel matrix
  [U,S,V]=svd(K);

  nt=n;
  %  if requested, truncate the number of singular values|
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
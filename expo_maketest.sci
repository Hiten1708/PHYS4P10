//
//  expo_maketest.sci
//	make f(t) + noise, for testing TR analysis of 
//	a distribution of relaxation rates, g(r) 
//
//  Completed: Dec.2005, Ed Sternin <edik at brocku.ca>
//  Contributions: Hartmut Schaefer
//
///////////////////////////////////////////////////////

datafile='test.dat';
noise=0.01;	// 1% of the max(f(t))
t_steps=1000;	// t-domain signal has this many points,
t_min=1;	//	from this minimum,
t_max=10000;	//	to this maximum
r_steps=500;	// r-grid has this many points,
r_min=1/t_max;	//	from this minimum,
r_max=1/t_min;	//	to this maximum

// Use an array of Gaussian peaks that make up the test g(r):
//peaks = [[0.5 0.20 0.05];[0.65 0.50 0.05];[0.75 0.80 0.06]];	// [amplitude center width]
peaks = [[0.6 0.35 0.1];[0.1 0.5 0.05];[0.25 0.70 0.125]];	// [amplitude center width]

//  create a vector of r values, logarithmically spaced
r_scale = log(r_max)-log(r_min);
r = exp([log(r_min):r_scale/(r_steps-1):log(r_max)]);

//  build up g(r) by adding Gaussian contributions from all peaks
g = zeros(length(r));
for k=1:length(peaks(:,1))
  r0 = log(r_min) +  r_scale*peaks(k,2);
  dr = r_scale*peaks(k,3);
  g = g + peaks(k,1) * exp (- (log(r) - r0).^2 / (2 * dr^2));
end;

scf(0); clf;
xset("wdim",600,800);
subplot(2,1,1); plot2d(r,g,style=2,logflag='ln');
xtitle('Test distribution, g(r)','r','');

//  create a vector of t values, linearly spaced
t = [t_min:(t_max-t_min)/(t_steps-1):t_max];

//  generate time-domain data
f = 1/(length(g)-1)*(g*(exp (-r'*t)))';

//  normalize and add random noise
f = f/max(f) + noise*max(f)*rand(f,"normal");

subplot(2,1,2); plot2d(t,f,style=3,logflag='nl');
xtitle('Test f(t), with '+string(100*noise)+'% random noise, saved in '+datafile,'t','');

if exists("MSDOS") then unix('del '+datafile); else unix('rm '+datafile); end;
write(datafile,[t',f]); 

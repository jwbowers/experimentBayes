// modified from 8schools.stan
data {
  int<lower=0> J; // number of schools
  real y[J]; // estimated treatment effects
  real<lower=0> sigma[J]; // s.e. of effect estimates
}
parameters {
 // real mu; // population mean
  real<lower=0> tau; // population sd
  real eta[J]; // school-level errors
}
transformed parameters {
  real <lower=0> theta[J]; // school effects, truncated at 0
  for (j in 1:J)
    theta[j] =  tau * eta[j];
}
model {
// eta ~ normal(0, 1);
//  y ~ normal(theta, sigma);
  target += normal_lpdf(eta | 0, 1);
  target += normal_lpdf(y | theta, sigma);
}

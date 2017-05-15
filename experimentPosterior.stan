data {
  real y; // estimated treatment effect
  real<lower=0> se; // s.e. of effect estimate
}
parameters {
  // real<lower=0> tau; // tau is the posterior treatment effect, require prior>=0
  real tau; // tau is the posterior treatment effect, allow negative treatment effects
  real<lower=0> sigma; // sigma is the posterior standard error
}
model {
 tau ~ normal(0,sigma); // a prior on the treatment effect, should be truncated at 0 depending on above
 y ~ normal(tau, se);
}

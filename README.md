# experimentBayes
How to create posterior distributions of experimental parameters using non-conjugate priors.

So far we are building on the 8 schools example that is part of the teaching materials for Stan in which we have treatment effects and standard errors in 8 schools.

At this point we have an example with a prior truncated at 0 and 1 treatment effect. We have not yet added a better prior.

Our objective is to develop a flexible program (maybe a Shiny app?) that uses numerical methods to update an arbitrary prior distribution in the wake of a normally distributed empirical estimate(s).
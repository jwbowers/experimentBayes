

## Building on https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
## the 8 schools example
library(rstan)

schools_dat <- list(J = 8,
                    y = c(28,  8, -3,  7, -1,  1, 18, 12),
                    sigma = c(15, 10, 16, 11,  9, 11, 10, 18))

## Now just for one school

schooltau <- c(28)
dim(schooltau) <- 1
schoolse <- c(14)
dim(schoolse) <- 1

exp_dat <- list(J = 1,
                y = schooltau,
                sigma = schoolse)

fit <- stan(file = 'experimentPosterior.stan', data = exp_dat,
            iter = 1000, chains = 4)



### This from www.stat.columbia.edu/~gelman/book/software.pdf
## The first paragraph of the above code specifies the data: the number
## of schools, J; the estimates, y1, . . . , yJ ; and the standard
## errors, σ1, . . . σJ . Data are labeled as integer or real and can
## be vectors (or, more generally, arrays) if dimensions are specified.
## Data can also be constrained; for example, in the above model J has
## been restricted to be nonnegative and the components of σy must all
## be positive.
 
## The code next introduces the parameters: the unknowns to be
## estimated in the model fit. These are the school effects, θj; the
## mean, μ, and standard deviation, τ, of the popula- tion of school
## effects, the school-level errors η, and the effects, θ. In this
## model, we let θ be a transformation of μ, τ, and η instead of
## directly declaring θ as a parameter. By parame- terizing this way,
## the sampler runs more efficiently; the resulting multivariate
## geometry is better behaved for Hamiltonian Monte Carlo.
 
## Finally comes the model, which looks similar to how it would be
## written in this book. (Just be careful: in our book, the second
## argument to the N(·,·) distribution is the vari- ance; Stan
## parameterizes using the standard deviation.) We have written the
## model in vector notation, which is cleaner and also runs faster in
## Stan by making use of more efficient autodifferentiation. It would
## also be possible to write the model more explic- itly, for example
## replacing y ~ normal(theta,sigma); with a loop over the J schools,
## for (j in 1:J) y[j] ~ normal(theta[j],sigma[j]);.



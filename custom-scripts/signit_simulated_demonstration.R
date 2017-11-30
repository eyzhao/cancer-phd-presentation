library(tidyverse)
library(devtools)
load_all('scripts/SignIT/')
library(rstan)
library(nnls)
library(dbscan)
library(Rtsne)

reference_signatures <- get_reference_signatures()
reference_signature_matrix <- reference_signatures_as_matrix(
  reference_signatures,
  mutation_catalog = reference_signatures
)

simulated_exposure <- c(
  300,
  0,
  300,
  0,
  300,
  rep(0, 25)
)

n_mutations <- sum(simulated_exposure)

catalog_probability_vector <- reference_signature_matrix %*% simulated_exposure / n_mutations

simulated_catalog <- tibble(
  mutation_type = reference_signatures[['mutation_type']],
  count = rmultinom(
    n = 1,
    size = n_mutations,
    prob = catalog_probability_vector
    ) %>% as.numeric
)

# Randomize the order to simulated catalog to test that functions are robust to reordering
simulated_catalog <- simulated_catalog[sample(1:dim(simulated_catalog)[1], replace = FALSE), ]

simulated_signature_exposures <- simulated_catalog %>%
    get_stan_exposures()

saveRDS(simulated_signature_exposures, 'meta/signit_simulated_output.Rds')

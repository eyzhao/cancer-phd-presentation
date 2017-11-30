library(tidyverse)
library(devtools)
load_all('scripts/SignIT/')
library(rstan)
library(nnls)
library(dbscan)
library(Rtsne)

patient_signature_exposures <- get_stan_exposures(
  mutation_catalog = example_catalog,
  n_chains = 4,
  n_iter = 1000,
  n_adapt = 200,
  n_cores = 4
)

saveRDS(patient_signature_exposures, 'meta/signit_output.Rds')

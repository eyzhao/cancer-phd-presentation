' pearson_signature_demonstration.R

Usage: pearson_signature_demonstration.R -r REF -m CATALOG -o OUTPUT

Options:
    -r --ref REF            Path to reference signature matrix
    -m --catalog CATALOG    Path to mutation catalog
    -o --output OUTPUT      Path to output figure
' -> doc

library(docopt)
args <- docopt(doc)

library(tidyverse)

ref_signatures <- read_tsv(args[['ref']])
signature_names <- ref_signatures %>% select(-mutation_type) %>% colnames
catalog <- read_tsv(args[['catalog']])

svg(args[['output']], height = 7, width = 8)

table <- ref_signatures %>%
    left_join(catalog, by = 'mutation_type') %>%
    gather(signature, probability, -mutation_type, -count) %>%
    mutate(signature = factor(signature, levels = signature_names))

print(table)

table %>%
    ggplot(aes(
        x = count,
        y = probability
    )) +
    geom_point() +
    facet_wrap(~signature) %>%
    print()

dev.off()

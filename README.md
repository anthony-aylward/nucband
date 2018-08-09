# nucband
Utility functions for calculating nucleosome banding scores from ATAC-seq data.

Adapted from [Andrew Hill's R script](https://github.com/shendurelab/mouse-atac/blob/master/banding_scores/calculate_nucleosome_banding_scores.R), which contains methods used in [Cusanovich et al.'s publication](https://www.cell.com/cell/fulltext/S0092-8674(18)30855-9).

See [this doc](https://ms.mcmaster.ca/~bolker/eeid/2010/Ecology/Spectral.pdf) for an introduction to spectral analysis.

## Installation

```
library(devtools)
install_github("anthony-aylward/nucband")
```

## Example

Assuming `insert_size` is an integer vector of insert sizes:

```
library(nucband)
density <- insert_size_density(insert_size)
score <- nucleosome_banding_score(density)
log(score)
```

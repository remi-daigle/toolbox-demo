## configure_toolbox.r

## configure_toolbox.r ensures all files in your repo are properly configured. It must be sourced before calculating OHI scores; here or from `calculate_scores.r`.

## You are encouraged to use this script when developing individual goal models. A good workflow is:
  ## 1. prepare data layers in the /prep folders (script as much as possible in R)
  ## 2. register data layers in layers.csv and save them in /layers folder
  ## 3. source configure_repo.r to ensure proper configuration
  ## 4. develop goal models in functions.r, running individual goal models line by line

## load ohicore and tidyverse (includes dplyr, tidyr, stringr, etc)
if (!"ohicore" %in% (.packages())) {
  suppressWarnings(require(ohicore))
  library(tidyverse)    # install.packages('tidyverse')
  library(stringr)
}

## set working directory to the scenario that contains conf and layers directories
layerswd <- 'region2016/'

## load scenario configuration
## 'conf' link all the data layers (for goal, pressures, resilience), goal functions, and other OHI parameters that determines how ohi scores
## are calculated
conf = ohicore::Conf(paste0(layerswd,'conf'))

## check that scenario layers files in the \layers folder match layers.csv registration. Layers files are not modified.
ohicore::CheckLayers('region2016/layers.csv', paste0(layerswd,'layers'), flds_id=conf$config$layers_id_fields)

## load scenario layers for ohicore to access. Layers files are not modified.
layers = ohicore::Layers('region2016/layers.csv', paste0(layerswd,'layers'))


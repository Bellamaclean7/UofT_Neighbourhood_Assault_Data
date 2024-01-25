#### Preamble ####
# Purpose: Ran tests on uoft_neighbourhoods, surrounding_neighbourhoods, and all_neighbourhoods to ensure the data is as expected
# Author: Bella MacLean
# Date: 25 January 2024
# Contact: bella.maclean@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)

# Read in cleaned data #
uoft_neighbourhoods <- read.csv(here::here("outputs/data/cleaned_data.csv"))
show_col_types = FALSE

# Read in cleaned data #
surrounding_neighbourhoods <- read.csv(here::here("outputs/data/analysis_data.csv"))
show_col_types = FALSE

# Read in cleaned data #
all_neighbourhoods <- read.csv(here::here("outputs/data/discussion_data.csv"))
show_col_types = FALSE

# Checking for any duplicated rows in the dataframes 
any(duplicated(uoft_neighbourhoods))
any(duplicated(surrounding_neighbourhoods))
any(duplicated(all_neighbourhoods))

# Checking to ensure the number of rows is as expected
nrow(uoft_neighbourhoods) # I want there to be 4 rows
nrow(surrounding_neighbourhoods) # I want there to be 9 rows
nrow(all_neighbourhoods) # I want there to be 13 rows

# Checking to ensure there are no missing values in the dataframes
sum(is.na(uoft_neighbourhoods))
sum(is.na(surrounding_neighbourhoods))
sum(is.na(all_neighbourhoods))

# Checking to ensure the dataframe holds only the unique neighbourhoods I want
unique(uoft_neighbourhoods$Neighbourhood)
unique(surrounding_neighbourhoods)
unique(all_neighbourhoods)
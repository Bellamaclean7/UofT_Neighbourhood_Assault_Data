#### Preamble ####
# Purpose: Cleans the raw data to create outputs/data/analysis_data.csv
# Author: Bella MacLean
# Date: 21 January 2024
# Contact: bella.maclean@mail.utoronto.ca
# License: MIT
# Pre-requisites: none

#### Workspace setup ####
library(tidyverse)
library(readr)

#### Clean data ####
raw_data <- read_csv("inputs/data/raw_data.csv")
View(raw_data)

# Select the specified columns and rename AREA_NAME and round each assault rate to 2 decimal places
assault_rate_data <- raw_data |>
  select(AREA_NAME, 
         ASSAULT_RATE_2014, ASSAULT_RATE_2015, ASSAULT_RATE_2016, 
         ASSAULT_RATE_2017, ASSAULT_RATE_2018, ASSAULT_RATE_2019, 
         ASSAULT_RATE_2020, ASSAULT_RATE_2021, ASSAULT_RATE_2022, 
         ASSAULT_RATE_2023) |>
  rename(Neighbourhood = AREA_NAME,
         `Assault Rate 2014` = ASSAULT_RATE_2014,
         `Assault Rate 2015` = ASSAULT_RATE_2015,
         `Assault Rate 2016` = ASSAULT_RATE_2016,
         `Assault Rate 2017` = ASSAULT_RATE_2017,
         `Assault Rate 2018` = ASSAULT_RATE_2018,
         `Assault Rate 2019` = ASSAULT_RATE_2019,
         `Assault Rate 2020` = ASSAULT_RATE_2020,
         `Assault Rate 2021` = ASSAULT_RATE_2021,
         `Assault Rate 2022` = ASSAULT_RATE_2022,
         `Assault Rate 2023` = ASSAULT_RATE_2023) |>
  mutate(
    `Assault Rate 2014` = round(`Assault Rate 2014`, 2),
    `Assault Rate 2015` = round(`Assault Rate 2015`, 2),
    `Assault Rate 2016` = round(`Assault Rate 2016`, 2),
    `Assault Rate 2017` = round(`Assault Rate 2017`, 2),
    `Assault Rate 2018` = round(`Assault Rate 2018`, 2),
    `Assault Rate 2019` = round(`Assault Rate 2019`, 2),
    `Assault Rate 2020` = round(`Assault Rate 2020`, 2),
    `Assault Rate 2021` = round(`Assault Rate 2021`, 2),
    `Assault Rate 2022` = round(`Assault Rate 2022`, 2),
    `Assault Rate 2023` = round(`Assault Rate 2023`, 2)
  )


# Filter rows for specific neighborhoods
surrounding_neighbourhoods <- assault_rate_data |>
  filter(Neighbourhood %in% c("Dovercourt Village",  "Church-Wellesley", "Palmerston-Little Italy", "Trinity-Bellwoods", "West Queen West", "Wellington Place", "Wychwood", "Casa Loma", "Yonge-St.Clair"))

# View the first few rows of the dataset with renamed variables
print(surrounding_neighbourhoods)

# Save the cleaned assault rate data
write_csv(
  x = surrounding_neighbourhoods,
  file = "outputs/data/analysis_data.csv"
)

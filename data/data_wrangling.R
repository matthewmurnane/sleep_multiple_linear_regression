library(readr)
library(tidyverse)
library(janitor)

sleep <- read_csv("data/Sleep_health_and_lifestyle_dataset.csv") %>% 
  clean_names()

glimpse(sleep)

sleep <- sleep %>%
  separate(blood_pressure, into = c("systolic", "diastolic"), sep = "/", convert = TRUE)

sleep$stress_level <- as.factor(sleep$stress_level)

sleep <- sleep %>%
  mutate(
    systolic = as.numeric(systolic),
    diastolic = as.numeric(diastolic),
    MAP = (2 * diastolic + systolic) / 3
  )

sleep <- subset(sleep, select = -c(person_id, systolic, diastolic))


glimpse(sleep)

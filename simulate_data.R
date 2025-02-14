library(dplyr)
library(tidyr)
library(tibble)

set.seed(3)

metabolites <- c("met_001", "met_002", "met_coll", "met_110")

data_normal <- data.frame(ObesityClass=rep("Normal weight", times=200),
                         Age=rnorm(n=200, mean=30, sd=3),
                         BMI=runif(n=200, min=18, max=25),
                         met_001=rnorm(n=200, mean=0.5, sd=0.5),
                         met_002=rnorm(n=200, mean=5, sd=1),
                         met_110=rnorm(n=200, mean=100, sd=100))
data_overweight <- data.frame(ObesityClass=rep("Overweight", times=100),
                         Age=rnorm(n=100, mean=30, sd=3),
                         BMI=runif(n=100, min=25, max=30),
                         met_001=rnorm(n=100, mean=0.7, sd=0.5),
                         met_002=rnorm(n=100, mean=4, sd=1),
                         met_110=rnorm(n=100, mean=100, sd=100))
data_obese <- data.frame(ObesityClass=rep("Obese", times=50),
                         Age=rnorm(n=50, mean=30, sd=3),
                         BMI=runif(n=50, min=30, max=40),
                         met_001=rnorm(n=50, mean=1, sd=0.5),
                         met_002=rnorm(n=50, mean=3, sd=1),
                         met_110=rnorm(n=50, mean=100, sd=100))

df <- bind_rows(data_normal, data_overweight, data_obese)
df$BMI <- log(df$BMI)
df$met_coll <- df$met_001 + 7.2*df$met_002 + rnorm(n=350, sd=0.5)


library(tidyverse)
library(readxl)

ejemplo <- read_excel("ejemplo.xlsx")

data <- ejemplo %>% 
  mutate(year = substring(fecha, 1, 4),
         ln_tcn = log(TCN),
         ln_dxy = log(`DXY Index`),
         ln_pcu = log(Pcu))

data_subset <- data %>% 
  filter(year >= 2014)

modelo_01 <- lm(TCN ~ `DXY Index`, data = data_subset)

summary(modelo_01)

modelo_02 <- lm(TCN ~ Pcu, data = data_subset)

summary(modelo_02)

plot(data_subset$Pcu, data_subset$TCN, 
     pch = 16, cex = 1.3, col = "blue", 
     main = "Relación TCN y Pcu", 
     xlab = "Pcu", ylab = "TCN")

abline(lm(TCN ~ PCU, data = data_subset))

modelo_03 <- lm(ln_tcn ~ ln_pcu, data = data_subset)

summary(modelo_03)

plot(data_subset$ln_pcu, data_subset$ln_tcn, 
     pch = 16, cex = 1.3, col = "blue", 
     main = "Relación TCN y Pcu", 
     xlab = "Ln Pcu", ylab = "Ln TCN")

abline(lm(ln_tcn ~ ln_pcu, data = data_subset))



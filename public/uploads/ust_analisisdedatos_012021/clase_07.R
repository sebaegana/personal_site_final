library(tidyverse)

# Create dataset 1
price <- c(1, 4, 6, 7, 8)
item <- c("candy", "socks", "tea", "coffee", "pens")
retailer <- c("Meijer", "Wal-Mart", "Publix", "Tim Hortons", "Staples")
# Combine vectors into data frame
df1 <- data.frame(price, item, retailer)
# Print top rows
head(df1)

# Create dataset 2
Retailer <- c("Best Buy", "Amazon", "Newegg", "eBay")
Item <- c("GPS", "SD Card Reader", "RTX 3090", "overpriced RTX 2080ti")
Price <- c(200, 20, 1499, 1100)
# Combine vectors into data frame
df2 <- data.frame(Retailer, Item, Price)
# Print top rows
head(df2)

# Create dataset 3
items <- c("keyboard", "mouse", "Raspberry Pi 4", "books", "dry erase board", "anti-virus software")
Manufacturer <- c("Logitech", "Logitech", "Raspberry Pi Foundation", "Penguin Publishing", "Office Max", "Kaspersky Labs")
price <- c(30, 40, 55, 120, 20, 50)
cost_of_production <- c(10, 12, 40, 30, 4, 8)
# Combine vectors into data frame
df3 <- data.frame(cost_of_production, price, items, Manufacturer)
# Print top rows
head(df3)

# Let's try different types of joins
# Left Join
left_join_test <- left_join(df1, df2, by = "Price")
head(left_join_test)
# Come on! Another error? Why? Let's try different tables

left_join_test_2 <- left_join(df1, df3, by = "price")
head(left_join_test_2)

df2 <- df2 %>% 
  rename(price = Price)




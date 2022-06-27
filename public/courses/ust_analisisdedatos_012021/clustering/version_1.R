library(readxl)
library(tidyverse)
library("factoextra")
library(FactoMineR)
library(cluster)
library(gridExtra)

data <- read_excel("BIData.xlsx")

View(data)


data_1 <- data %>% 
  select(-Date, -Month, -Weekday, - Quarter, -Day_month, -Weeknum, -Year) %>% 
  mutate(Gender = ifelse(Gender == "F", 1, 0),
         Education_level = ifelse(Education_level == "Till 10th", 1, 
                                  ifelse(Education_level == "Till 12th", 2, 
                                         ifelse(Education_level == "Graduate", 3, 4))),
         Purpose = ifelse(Purpose == "Home", 1, 
                          ifelse(Purpose == "Travel", 2, 
                                 ifelse(Purpose == "Personal", 3, 
                                        ifelse(Purpose == "Education", 4, 5)))))


res.pca <- PCA(data_1,  graph = FALSE)

get_eig(res.pca)


fviz_screeplot(res.pca, addlabels = TRUE, ylim = c(0, 50))

var <- get_pca_var(res.pca)

var

head(var$coord)

head(var$contrib)

fviz_pca_var(res.pca, col.var = "black")

fviz_pca_var(res.pca, col.var="contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Avoid text overlapping
)

# Contributions of variables to PC1
fviz_contrib(res.pca, choice = "var", axes = 1, top = 10)

# Contributions of variables to PC2
fviz_contrib(res.pca, choice = "var", axes = 2, top = 10)

ind <- get_pca_ind(res.pca)
ind

head(ind$coord)

fviz_pca_ind(res.pca, col.ind = "cos2", 
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE # Avoid text overlapping (slow if many points)
)

## Clusters

set.seed(123)
km.res_1 <- kmeans(data_1, 2, nstart = 25)
km.res_2 <- kmeans(data_1, 3, nstart = 25)
km.res_3 <- kmeans(data_1, 4, nstart = 25)
km.res_4 <- kmeans(data_1, 5, nstart = 25)

print(km.res_4)

aggregate(data_1, by=list(cluster=km.res_4$cluster), mean)

dd <- cbind(data_1, cluster = km.res_4$cluster)
head(dd)

p1 <- fviz_cluster(km.res_1, geom = "point", data = data_1) + 
  ggtitle("k = 2")
p2 <- fviz_cluster(km.res_2, geom = "point",  data = data_1) + 
  ggtitle("k = 3")
p3 <- fviz_cluster(km.res_3, geom = "point",  data = data_1) + 
  ggtitle("k = 4")
p4 <- fviz_cluster(km.res_4, geom = "point",  data = data_1) + 
  ggtitle("k = 5")

grid.arrange(p1, p2, p3, p4, nrow = 2)

# Número óptimo de clusters

set.seed(123)

fviz_nbclust(data_1, kmeans, method = "wss")
fviz_nbclust(data_1, kmeans, method = "silhouette")

set.seed(123)
gap_stat <- clusGap(data_1, FUN = kmeans, nstart = 25,
                    K.max = 10, B = 50)
fviz_gap_stat(gap_stat)

set.seed(123)
final <- kmeans(data_1, 2, nstart = 25)
fviz_cluster(final, data = data_1)

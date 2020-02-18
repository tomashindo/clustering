file <- file("data.csv", open="r", encoding="shift-jis")
data <- read.table(file, header=T, sep=",", fill = TRUE)

factor1 = data$factor1
factor1 <- subset(factor1, complete.cases(factor1))
factor2 = data$factor2
factor2 <- subset(factor2, complete.cases(factor2))

d <- cbind(factor1,factor2)

results <- hclust(dist(d))
results

png("hclust.png", width = 2000, height = 1000, pointsize = 2, res=500)

plot(results, hang=-1)
rect.hclust(results, k = 5)

dev.off()
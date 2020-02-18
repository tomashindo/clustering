file <- file("data.csv", open="r", encoding="shift-jis")
data <- read.table(file, header=T, sep=",", fill = TRUE)

factor1 = data$factor1
factor1 <- subset(factor1, complete.cases(factor1))
factor2 = data$factor2
factor2 <- subset(factor2, complete.cases(factor2))

d <- cbind(factor1, factor2)

results <- kmeans(d, 3)
results

png("k-means.png", width = 1000, height = 700, pointsize = 3, res=500)

plot(d, type="n")
text(d, lab=as.character(1:47),col=results$cluster)

dev.off()
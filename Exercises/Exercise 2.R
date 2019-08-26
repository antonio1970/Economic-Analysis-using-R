# Graphical analysis of both variables
# boxplot to checj outliers

par(mfrow = c(1,2))

# 1st boxplot using R base

boxplot(datos_male$Hg, col = "Yellow",
        main = "Hemaglobin boxplot",
        ylab = 'g per decaliter')
boxplot(datos_male$Hc, col = "Red",
        main = "Hematocrite boxplot",
        ylab = 'percentage')
# Get the value of the outliers

boxplot.stats(datos_male$Hg)$out
boxplot.stats(datos_male$Hc)$out

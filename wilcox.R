#--------------------------------------------------------------------------------------------------
# Comparando distribuicoes com Wilcox
#
# Gorgens, Eric Bastos
# Department of Forest Sciences
# University of Sao Paulo
# Piracicaba, Brazil
# gorgens (at) usp.br
#
# Last revision: 2013-06-22
#--------------------------------------------------------------------------------------------------

# comparando tempo de florescimento de especies nativas e exoticas
 
df <- read.csv("flowering_alien_vs_indigen.csv", sep = ";") # o separador pode mudar de computador para computador
head(df)
names(df)

# usando o grafico quantil-quantil (qqplot)
library(lattice) # este e outro pacote grafico disponivel para o R
 
histogram(~ Flowering|Status, data = df, col = "gray60", layout = c(1, 2),
          xlab = list("Mes de florecimento"),
          ylab = list("Percentual do total"),
          scales = list(y = list(alternating = F)),
          strip = strip.custom(factor.levels = c("alien", "indigenous")))
 
# o teste de Wilcox (mudancas na mediana)
wilcox.test(Flowering ~ Status, data = df)


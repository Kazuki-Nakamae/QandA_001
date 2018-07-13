# Q : How to add column names with ggplot2 in R
# A : ↓

# install package
options(repos="https://cran.ism.ac.jp/")
#install.packages("reshape2")
library(reshape2)
#install.packages("ggplot2")
library(ggplot2)

(data <- read.csv("./QandA_001/data.csv"))
(data.means <- apply(data, 2, mean))
(dm <- melt(data.means, value.name="values"))

# Check the return value of melt()
### OUTPUT ###
# >help(melt)
# melt                 package:reshape2                  R Documentation
# 
# Convert an object into a molten data frame.
# ...
### END ###

# The return value of melt() may be "data frame"
# Confirm the data type
# >is.data.frame(dm)
### OUTPUT ###
#[1] TRUE
### END ###

# The return value of melt() may be "data frame"
# Confirm the data type
# >is.data.frame(dm)
### OUTPUT ###
#[1] TRUE
### END ###

# All "data frames" have a row names attribute.
# You can check this attribute using rownames()
# >rownames(dm)
### OUTPUT ###
#[1] "X.N.C.." "X.mock." "X.LoAD."
### END ###

# You should make a new data frame using rownames(dm).

new.dm <- data.frame(variables = rownames(dm), values = dm$values)

(p <- ggplot(data = new.dm, aes(x = variables, y = values, fill = variables)) + geom_bar(stat="identity"))

# other solutions
# You can do the same with base functions.
#(data <- read.csv("./QandA_001/data.csv"))
#(data.means <- apply(data, 2, mean))
#(dm <- data.frame(values = data.means))
#(new.dm <- data.frame(variables = rownames(dm), values = dm$values))
#(p <- ggplot(data = new.dm, aes(x = variables, y = values, fill = variables)) + geom_bar(stat="identity"))

suppressMessages( library(phantasus) )
d <- readRDS("./EwS.rds")
library(DESeq2)

pThr <- 0.01
logFcThr <- 1
baseMeanThr <- 20
cpmThr <- 1

dds <- DESeqDataSet(d, design = ~condition)
rld <- rlog(dds)
plotPCA(rld)
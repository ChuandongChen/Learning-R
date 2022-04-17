  # 获取数据

# CSV获取数据
install.packages("learningr")
library(learningr)
deer_file <- system.file(
    "extdata",
    "RedDeerEndocranialVolume.dlm",
    package = "learningr"
)

deer_data <- read.table(deer_file, header = TRUE, fill = TRUE)
str(deer_data, vec.len = 1)

# Getting unstructure data
text_file <- system.file(
    "extdata", 
    "Shakespeare's The Tempest, from Project Gutenberg pg2235.txt",
    package = "learningr"
) # Get a text file

the_tempest <- readLines(text_file) # Capital L
the_tempest[1926:1927]

# 读取excel, stata, matlab, json, yaml, xml, html

# 读取web数据
# 世界银行
install.packages("WDI")
library(WDI)
wdi_datasets <- WDIsearch()
head(wdi_datasets)
wdi_trade_in_services <- WDI(
    indicator = "BG.GSR.NFSV.GD.ZS"
)
str(wdi_trade_in_services)

# Yahoo stock
install.packages("quantmod")
library(quantmod)
?getSymbols
microsoft <- getSymbols("MSFT", env = NULL) # env = NULL 是获得数据的关键
head(microsoft)


# 抓取网页
salary_url <- "http://www.justinmrao.com/salary_data.csv"
salary_data <- read.csv(salary_url, fill = TRUE, header = FALSE)
head(salary_data)

# 更快方式
salary_url <-  "http://www.justinmrao.com/salary_data.csv"
local_copy <- "my local copy.csv" # a string for local copy
download.file(salary_url, local_copy)
salary_data <- read.csv(local_copy)



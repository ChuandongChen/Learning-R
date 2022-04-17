# Data Cleaning and processsing

# 如何将Y和N换为TRUE和False
yn_to_logical <- function(x){
    y <- rep.int(NA, length(x))
    y[x == "Y"] <- TRUE
    y[x == "N"] <- FALSE
    y
}

?rep.int

head(alpe_d_huez)
alpe_d_huez$DrugUse <- yn_to_logical(alpe_d_huez$DrugUse)
head(alpe_d_huez)

# 将男转换为女
gender_trans <- function(x){
    y <- rep(NA, length(x))
    y[x == "男"] <- "Male"
    y[x == "女"] <- "Female"
    y
}

gendertrans_data <- read.csv("C:/Users/Cathe/OneDrive/Digitalization/R/学习R/Gendertrans_Sampledata.csv")
head(gendertrans_data)

getwd()
setwd("C:Users/Cathe/OneDrive/Digitalization/R/学习R")

gendertrans_data$性别 <- gender_trans(gendertrans_data$性别)
head(gendertrans_data)

# 更高效的字符串替换
data(english_monarchs, package = "learningr")
head(english_monarchs)

library(stringr)
multiple_kingdoms <- str_detect(english_monarchs$domain, fixed(","))
english_monarchs[multiple_kingdoms, c("name", "domain")]

# 正则表达式
multiple_rulers <- str_detect(english_monarchs$name, ",|and")
head(multiple_rulers)
english_monarchs$name[multiple_rulers & !is.na(multiple_rulers)]

# 如何统一国王名字
english_monarchs$new_name <- str_replace_all(english_monarchs$name, "[ðþ]", "th")
head(english_monarchs)

gender <- c("男", "男性", "男的", "男人", "女", "女性", "女的", "女人")

clear_gender <- str_replace(
    gender,
    ignore.case("^男(人)?$"),
    "男"
)

# Mulnipulate data frame
# 添加一列表示执政年限
english_monarchs$length.of.reign.years <- english_monarchs$end.of.reign - english_monarchs$start.of.reign # 最传统的变量赋值方法

# with 函数简化调用变量
english_monarchs$length.of.reign.years <- with(
    english_monarchs, 
    end.of.reign - start.of.reign
)

# 类似的within 函数
english_monarchs <- within(
    english_monarchs,
    {
        length.of.reign.years <- end.of.reign - start.of.reign
    }
)

# 可以修改更多列的within 方法
english_monarchs <- within(
    english_monarchs,
    {
        length.of.reign.years <- end.of.reign - start.of.reign
        reign.was.more.than.30.years <- length.of.reign.years > 30
    }
)

head(english_monarchs)

# 关于性别转换的练习
hr_file <- read.csv("C:/Users/Cathe/OneDrive/Digitalization/R/学习R/HR_file.csv")
head(hr_file)
View(hr_file)

hr_file_data <- hr_file[4:493,2:7]
head(hr_file_data)
names(hr_file_data) <- c("gender", "name", "family_name", "given_name", "enter_date", "last_date")

hr_file_data$servingdays <- hr_file_data$last_date - hr_file_data$enter_date
# R 中的日期处理


# Mulnipulate NA
data("deer_endocranial_volume", package = "learningr")
has_all_measurements <- complete.cases(deer_endocranial_volume) # Return a logical vector
deer_endocranial_volume[has_all_measurements,]

# 数据在长宽之间转换
deer_wide <- deer_endocranial_volume[, 1:5]
head(deer_wide)
library(reshape2)

na.omit(deer_endocranial_volume) # delete data containing NA
na.fail(deer_endocranial_volume) # Check any na

# 4 Rating
x <- c(2, 31, 32, 5, 9, 10)
sort(x, decreasing = TRUE)

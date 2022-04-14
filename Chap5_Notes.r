## Lists and Data Frames 
# Create a list
(a_list <- list(
    c(1, 1, 2, 5, 14, 42), # Vector
    month.abb, # factor
    matrix(c(3, -8, 1, -3), nrow = 2), # Matrix
    asin # function
))

names(a_list) <- c("catalan", "months", "involutary", "arcsin")

(the_same_list <- list(
catalan <- c(1,1,2,5,14,42),
months = month.abb,
involutary = matrix(c(3, -8, 1, -3), nrow = 2),
arcsin <- asin
))

# List index
the_same_list$months

# Converting Between Vectors and Lists
busy_beaver <- c(1, 6, 21, 107)
as.list(busy_beaver)

as.numeric(list(1, 6, 21, 107))

# Combining Lists 
c(list(a = 1, b = 2), list(3))

# What will happen setting an element to NULL?
(a_data_frame <- data.frame(
    x = letters[1:5], 
    y = rnorm(5),
    z = runif(5) > 0.5 # 在0, 1 区间内生成均匀分布的五个数， eg. runif(n, min = 0, max = 1)
))

# 其中一列的行名会分配给整个dataframe
y <- rnorm(5)
names(y) <- month.name[1:5]
y
data.frame(
    x = letters[1:5],
    y = y,
    z = runif(5) > 0.5 ,
    row.names = c("J", "T", "Je", "M", "Mi"), check.rows = FALSE, check.names = TRUE, stringsAsFactors = default.stringsAsFactors())

# Basic manipulation
rbind()
cbind()

another_data_frame <- data.frame(
    z = rlnorm(5),
    y = sample(5),
    x = letters[3:7], stringsAsFactors = default.stringsAsFactors())

merge(a_data_frame, another_data_frame, by = "x", all = TRUE)

# Exercises
# 5-1 Create a list variable that contains all the square numbers in the range 0 to 9 in the first element, 
# in the range 10 to 19 in the second element, and so on, up to a final element with square numbers in the range 90 to 99. 
# Elements with no square num‐ bers should be included!
list_q1 <- list(
    "a" = c(square(0:9),
    "b" = c(square(10:)))
)

# 2
iris_df <- data.frame(iris)
colMeans(iris_df[, 2:5])

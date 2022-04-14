## Chap 4 Notes
# 利用vector创建一个空值向量, 其中的元素分别为numeric, complex, logical, character, list 
vector(“numeric”, 5)
vector(“complex”, 5)
vector(“logical”, 5)
vector(“character”, 5)
vector(“list”, 5)

# values concatenated into single vector
c(1, 1:3, c(5, 8), 13)

# 创建一个步长为2， 从2到18的sequence
seq.int(2, 18, 2)

# 创建一个步长为1， 从1到10的sequence
seq_len(10)

# 测度序列的长度
length()

# 对序列中的元素进行命名
x <- 1:5
names(x) <- c("apple", "banana", "cream", "dream", "euro")

# 截取x中的1，3，5 项
x[c(1, 3, 5)]
x[c(-2, -4)]
x[c(TRUE, FALSE, TRUE, FALSE, TRUE)]
x[c("apple", "cream", "euro")]

# 截取的时候不可同时使用正负数， 如果数量是分数，则会向0取整，例如1.9为1， -1.9为-1

# 找到向量中max最大或者满足其余条件的元素
which(x < 3)
which.max(x)
which.min(x)

# 生成元素重复的向量
# 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
rep(1:5, 3)
# 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5
rep(1:5, each = 3)
# 1 2 2 3 3 3 4 4 4 4 5 5 5 5 5
rep(1:5, times = 1:5)
# 1 2 3 4 5 1 2
rep(1:5, length.out = 7)

## Creating Arrays and Matrices
# 生成一个三维array，维度为4，3，2
three_d_array <- array(
    1:24, 
    dim = c(4, 3, 2),
    dimnames = list(
        c("one", "two", "three", "four"),
        c("ein", "zwei", "drei"),
        c("un", "deux")
    )
)
three_d_array

# 生成一个四行矩阵
a_metrix <- matrix(
    data = 1:12, nrow = 4, ncol = 3, 
    byrow = TRUE, # 使得数字横向填充
    dimnames = list(
        c("Jan", "Feb", "Mar", "Apr"),
        c("CPI", "PPI", "RI")
    ))
a_metrix


# 可以使用array函数生成矩阵

# 查看array或者matrix维度
dim()
nrow()
ncol()
length() #统计所有元素数量

# 获取行列名称
rownames()
colnames()
dimnames()

# 截取array
# 截取数组的第一列
a_metrix[, 1]

# Combine Matrix 
(another_matrix <- matrix(
      seq.int(2, 24, 2),
      nrow = 4,
      dimnames = list(
        c("five", "six", "seven", "eight"),
        c("vier", "funf", "sechs")
      )
))

c(a_metrix, another_matrix) # It becomes a vector!

cbind(a_metrix, another_matrix) # cbind会将行名称以第一个为标准
rbind(a_metrix, another_matrix) # rbind会将列名称以第一个矩阵为标准

# 如何转置矩阵
t(a_metrix)

# 矩阵的内乘与外乘
a_metrix %*% t(a_metrix) # inner multiplication 
1:3 %o% 4:6

# 对矩阵进行幂运算
a_metrix ^ -1 

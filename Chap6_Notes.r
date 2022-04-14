## Environments and Functions
# Environment 
rt

# Create a function
hypotenuse <- function(x, y)
    {
    sqrt(x ^ 2 + y ^ 2)
    } # Argument should be run with the function 

# Call the function
hypotenuse(3, 4)

# Get default value
formals(hypotenuse)
args(hypotenuse)
formalArgs(hypotenuse)

# Get functions body
body(hypotenuse)
deparse(hypotenuse)

# Complex argument
normalize <- function(x, m = mean(x, na.rm = na.rm), s = sd(x, na.rm = na.rm), na.rm = FALSE)
{
  (x - m) / s
}

# 但是此种方式对NA非常敏感，最好可以在计算之前就将所有NA去除

normalize(c(1, 2, 3, 5, 7, NA), na.rm = TRUE)

?do.call

# 使用do.call
do.call(rbind, list(dfr1, dfr2, dfr3))


# Exercise
# 1 练习6-1
#创建一个名为 multiples_of_pi 的新环境 。将以下变量分配到此环境中: (1) two_pi，值为 2 * π，使用双方括号;
# (2) three_pi，值为 3 * π，使用美元符号运算符;
# (3) four_pi，值为 4 * π，使用 assign 函数。 列出环境的内容，以及它们的值。[10]
multiples_of_pi <- new.env()
multiples_of_pi[["two_pi"]] <- c(2 * pi)
multiples_of_pi$three_pi <- c(3 * pi)
assign(
    "four_pi",
    c(4 * pi),
    multiples_of_pi
)
ls(envir = multiples_of_pi)
ls.str(envir = multiples_of_pi)

# 2 写一个接受一个整数向量的函数(为简单起见，你不用担心输入检查)，它将返回一个 逻辑向量。
# 其判断逻辑是:如果输入值是偶数则返回 TRUE;奇数则返回 FALSE;非有限值(非有限值指任何能使用 is.finite 函数返回 FALSE 的东西:
# 如 Inf、-Inf、NA 和 NaN)则返回 NA。输入正、负、零和非无限值来检查此函数
input_check <- function(x) 
{
    if (x %% 2 = 0) {
       TRUE
    } else {
        if (is.finiate(x) = FALSE) {
           NA
        else {
           FALSE
        }
    }}
}

input_check <- function(x){
    if (x %% 2 == 0)
        print(TRUE)
}

input_check(2)

input_check2 <- function(x){
    if (x %% 2 == 0) {
        print(TRUE)
        } else if (is.finite(x)) 
            {FALSE} else {
                NA
                }
}

input_check3 <- function(x){
    if (is.finite(x)) {
        if (x %% 2 == 0){
            print(TRUE)
        } else {
            print(FALSE)
        }
    } else {
       NA
    }
}

data_for_e2 <- c(1, 2, 4, 5, 3)
input_check3(data_for_e2)

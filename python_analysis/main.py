# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

# 打印字符
def printX(n):
    matrix = [[" "] * n for _ in range(n)]
    left, right = 0, n - 1
    for i in range(n):
        matrix[i][left] = 'X'
        matrix[i][right] = 'X'
        left += 1
        right -= 1
    result = []
    print(matrix)
    for i in range(n):
        result.append("".join(matrix[i]))
    return result


def isPalindrome(n):
    a = str(bin(n))
    b = a[2:]
    if n == 0:
        return True
    c = len(b) - 1
    for i in range(int(c / 2)):
        if b[i] != b[len(b) - 1]:
            return False
    return True


# 回文判断
def isPalindrome1(n):
    a = str(bin(n))
    b = a[2:]
    c = b[::-1]
    if c == b:
        return True
    else:
        return False


# 杨辉三角
def calcYangHuisTriangle(n):
    res = []
    if n == 0:
        return res
    for i in range(n):
        temp = [1]
    for j in range(1, i):
        temp.append(res[i - 1][j - 1] + res[i - 1][j])
    if i > 0:
        temp.append(1)
        res.append(temp)
    return res


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    # a = printX(5)
    # print(a)
    isPalindrome1(99)
    calcYangHuisTriangle(5)
# See PyCharm help at https://www.jetbrains.com/help/pycharm/

bin(99)
a = bin(99)
print(a[1])

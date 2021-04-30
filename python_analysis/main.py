# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

# 打印字符
def printX(n):
    matrix = [[" "] * n for _ in range(n)]
    left, righ = 0, n - 1
    for i in range(n):
        matrix[i][left] = 'X'
        matrix[i][righ] = 'X'
        left += 1
        righ -= 1
    result = []
    print(matrix)
    for i in range(n):
        result.append("".join(matrix[i]))
    return result


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    a = printX(5)
    print(a)
# See PyCharm help at https://www.jetbrains.com/help/pycharm/

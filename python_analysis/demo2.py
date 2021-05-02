import numpy as np
import matplotlib.pyplot as plt

# 原始数据及
x = np.mat([1, 2, 3, 4, 5, 6])
y = np.mat([2, 4, 6, 8, 10, 12])
a = 0
b = 0
canshu = np.mat([a, b])
plt.xlabel('x')
plt.ylabel('y')
plt.show()
x = np.matrix(x)
x = np.transpose(x)
canshu = np.transpose(canshu)

print(canshu)
x = np.column_stack(([1, 1, 1, 1, 1, 1], x))
print(x)
y = np.transpose(y)
print(y)

# 学习速率
alpha = 0.0001
# 步长（循环次数）
step = 1000
i = 1
# 梯度下降法求参数优化
for i in range(step):
    prey = x * canshu
    # loss = 0.5*3*np.square((y-prey),(y-prey))
    # print('error square',loss)
    a = a + alpha * ((y - prey).T * np.mat([1, 1, 1, 1, 1, 1]).T)
    b = b + alpha * ((y - prey).T * np.mat([1, 2, 3, 4, 5, 6]).T)
    canshu = np.column_stack((a, b)).T
    plt.plot(x, prey)

print(np.column_stack((a, b)).T)
print(canshu)

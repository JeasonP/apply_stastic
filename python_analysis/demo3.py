import sys
import copy
from numpy import *
import numpy as np
import matplotlib.pyplot as plt

f = open('/home/pomtbo/apply_stastic/python_analysis/housing.data', "r")
Data = f.readlines()

'''
处理数据，先对数据进行分割，并转换成float型变量
为了之后梯度下降的过程中减少消耗，进行特征缩放
获取平均值,与最大值：

平均值分别为
3.61352356, 11.36363636, 11.13677866, 0.06916996, 0.55469506, 6.28463439, 68.57490119, 3.79504269, 9.54940711, 408.23715415, 18.4555336, 356.67403162, 12.65306324
最大值分别为
88.9762, 100, 27.74, 1, 0.871, 8.78, 100, 12.1265, 24, 711, 22, 369.9, 37.97

大概的范围选择在-1~1
定义初始的参数向量为全 1
'''
for i in range(506):
    Data[i] = Data[i].rstrip('\n')
    Data[i] = Data[i].split()
    for j in range(13):
        Data[i][j] = float(Data[i][j])

Data = np.mat(Data)
Data = Data.astype("float64")
Average = Data.sum(axis=0) / 506
Max = Data.max(axis=0)

# 为了保证特征值范围进行调整
for i in range(14):
    Data[:, i] = (Data[:, i] - Average[0, i]) / Max[0, i]

# 梯度
Alpha = 0.01
# 特征值向量
Feature = Data[:, 0:13]
# 结果向量
Result = Data[:, 13]

# 创建参数向量，为一个1*13的矩阵
Parameter = mat(ones((13, 1)))
intercept = 0  # 截距
Sub_value = sys.maxsize
count = 0
debugging = [0 for i in range(11)]
debugging_1 = [i for i in range(11)]
IsEnd = False
''''
#通过转置完成计算
Parameter = np.transpose(Parameter)
#计算结果

Feature = Feature*Parameter

Result = abs(Result - Feature)
print(Result)

进行梯度下降，定义代价函数，操作全局变量判断是否结果更加优化
'''


def Steepest_Descent(Feature_1, Result_1, x):
    global Parameter, Alpha, Sub_value, IsEnd, intercept, count

    Feature_temp = copy(Feature_1)  # 防止特征向量被修改
    Forecast = Feature_temp * Parameter  # 预测结果

    Forecast = Forecast - Result_1  # 差值
    # print(Forecast)
    Value_mat = abs(Forecast)
    Value = Value_mat.sum(axis=0)
    # debugging[count] = Value[0,0]
    count = count + 1
    '''
    #计算限度
    if count==20000 or count==30000 or count==79000:
        print(Value)

    #print("Feature_temp",Feature_temp.shape)

    Forecast:506*1
    Feature_temp:506*13
    Parameter:13*1
    '''

    # print(Value)
    if Value[0, 0] < Sub_value:
        Sub_value = Value[0, 0]
    else:
        print(Value[0, 0])
        IsEnd = True
        return

    Delta = mat(ones((13, 1)))
    # 计算变化量
    for i in range(13):
        # temp = mat(ones((506,1)))
        temp = Feature_temp[:, i]  # 因为要*Xij
        np.transpose(Forecast)
        temp_1 = temp * Forecast
        Delta[i, 0] = temp_1[0, 0] / x
    # 更新系数
    Parameter = Parameter * 0.9 - Alpha * Delta
    intercept = intercept - Alpha * Forecast.sum(axis=0)[0, 0] / x
    # print("Parameter's shape:",Parameter.shape)


if __name__ == "__main__":
    RootError = 0

    '''
    留一法测试的内容
    for n in range(506):
        Feature_left = copy(Feature)
        Result_left = copy(Result)
        delete(Feature_left,n,axis=0)
        delete(Result_left,n,axis=0)
        for i in range(30000):
            Steepest_Descent(Feature_left,Result_left,505)
        temp = Feature[n,:]        #取出这一行当做测试数据
        temp = temp*Parameter
        RootError = RootError +abs(temp[0,0]-Data[n,13])

        #初始化
        Parameter = mat(ones((13, 1)))
        Sub_value = sys.maxsize
        IsEnd = False
        intercept = 0

    RootError = RootError / 506
    IsEnd = False   
    #整体再算一遍

    '''
    while not IsEnd:
        Steepest_Descent(Feature, Result, 506)

    print("总次数", count)
    print("参数向量为", Parameter)
    # print("常数项为",intercept)
    print("留一法得到RMSE为", RootError)

    plt.figure()
    plt.scatter(debugging_1, debugging, color="b")
    plt.xlabel('x')
    plt.ylabel('y')
    plt.show()

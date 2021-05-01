#*******************************************************
#*******《应用多元统计分析》（第五版）R代码 ********
#****************** 王学民   2021.2 ********************
#从https://anyshare.sufe.edu.cn/#/link/B9F2F217DF9A179950462AF6B590145F下载《应用多元统计分析》（第五版）配书资料，下载的资料中有一个“《应用多元统计分析》（第五版）文本数据（以逗号为间隔）”的文件夹#
#假定数据存储目录为“C:/mvdata/”#
#*******************************************************


###第五章###

##例5.2.3##
examp5.2.3<-read.table("R_operate/data_csv/examp5.2.3.csv", header=T, sep=",") #读取文本文件
examp5.2.3
library(MASS) #加载MASS包
#(1)进行基于两组协差阵相等的贝叶斯判别#
ld1<-lda(g~x1+x2+x3+x4, prior=c(0.5, 0.5), examp5.2.3) #先验概率相等的线性判别，先验概率缺省时按与各组样本容量大小成比例的概率
ld1
Z<-predict(ld1) #根据线性判别函数预测所属类别
round(Z$posterior, 3) #后验概率结果, 保留3位小数
newg<-Z$class #预测的所属类别结果
cbind(g=examp5.2.3$g, round(Z$posterior, 3), newg) #按列合并的结果
table1<-table(g=examp5.2.3$g, newg) #判别情况表
round(prop.table(table1, 1), 3) #正确和错误判别率，保留3位小数
ld2<-lda(g~x1+x2+x3+x4, prior=c(0.5, 0.5), CV=T, examp5.2.3) #选项“CV=T”表示采用交叉验证法
newg<-ld2$class #预测的所属类别结果
cbind(g=examp5.2.3$g, round(ld2$posterior, 3), newg)
table2<-table(g=examp5.2.3$g, newg)
round(prop.table(table2, 1), 3)
#(2)进行基于两组协差阵不等的贝叶斯判别#
qd1<-qda(g~x1+x2+x3+x4, prior=c(0.5, 0.5), examp5.2.3) #二次判别
qd1
Z<-predict(qd1) #根据二次判别函数预测所属类别
newg<-Z$class
cbind(g=examp5.2.3$g, round(Z$posterior, 3), newg)
table3<-table(g=examp5.2.3$g, newg)
round(prop.table(table3, 1), 3)
qd2<-qda(g~x1+x2+x3+x4, prior=c(0.5, 0.5), CV=T, examp5.2.3) #使用交叉验证法
newg<-qd2$class
cbind(g=examp5.2.3$g, round(qd2$posterior, 3), newg)
table4<-table(g=examp5.2.3$g, newg)
round(prop.table(table4, 1), 3)

##例5.3.1##
p1<-0.05; p2<-0.65; p3<-0.30
f1<-0.10; f2<-0.63; f3<-2.4
g<-p1*f1+p2*f2+p3*f3
P1<-p1*f1/g
P2<-p2*f2/g
P3<-p3*f3/g
round(c(P1, P2, P3), 3)

##例5.3.2##
examp5.2.3<-read.table("R_operate/data_csv/examp5.2.3.csv", header=T, sep=",")
library(MASS) #加载MASS包
ld3<-lda(g~x1+x2+x3+x4, prior=c(0.1, 0.9), examp5.2.3) #先验概率不相等的线性判别
ld3
examp5.3.2<-read.table("R_operate/data_csv/examp5.3.2.csv", header=T, sep=",") #读取新样品的文本文件
examp5.3.2
newZ<-predict(ld3, examp5.3.2) #预测新样品所属类别
newZ

##例5.3.5##
p1<-0.05; p2<-0.65; p3<-0.30
f1<-0.10; f2<-0.63; f3<-2.4
c11<-0; c12<-20; c13<-60; c21<-10; c22<-0; c23<-50; c31<-200; c32<-100; c33<-0
h1<-p2*c12*f2+p3*c13*f3
h2<-p1*c21*f1+p3*c23*f3
h3<-p1*c31*f1+p2*c32*f2
c(h1, h2, h3)

##例5.4.1##
examp5.4.1<-read.table("R_operate/data_csv/examp5.4.1.csv", header=T, sep=",")
examp5.4.1
library(MASS)
ld<-lda(g~x1+x2+x3+x4, examp5.4.1) #可显示费希尔判别系数及特征值结果
ld
Z<-predict(ld)
round(Z$x, 3) #费希尔判别得分, 保留3位小数
plot(Z$x, cex=1.4) #作散点图
text(Z$x[, 1], Z$x[, 2], cex=0.5, examp5.4.1$g) #为散点标号

##例5.5.1##
#笔者未能找到含有逐步判别内容的R包，本例R代码暂空着#

##习题5.2##
mean1<-c(4, 2); mean2<-c(3, -1); x0<-c(2, 1)
Sp<-matrix(c(6.5, 1.1, 1.1, 8.4), nrow=2)
mean<-(mean1+mean2)/2
mean
a<-solve(Sp)%*%(mean1-mean2)
a
Wx0<-t(a)%*%(x0-mean)
Wx0

##习题5.3##
p1<-0.55; p2<-0.15; p3<-0.3
f1<-0.46; f2<-1.5; f3<-0.7
c11<-0; c12<-400; c13<-100; c21<-20; c22<-0; c23<-50; c31<-80; c32<-200; c33<-0
h1<-p2*c12*f2+p3*c13*f3
h2<-p1*c21*f1+p3*c23*f3
h3<-p1*c31*f1+p2*c32*f2
c(h1, h2, h3)
c(p1*f1, p2*f2, p3*f3) #不考虑误判代价时的计算结果

##习题5.5##
exec5.5<-read.table("R_operate/data_csv/exec5.5.csv", header=T, sep=",")
exec5.5
n1<-10; n2<-10; x0<-c(0.6, 3)
library(MASS)
#(1)#
ld1<-lda(g~x1+x2, prior=c(0.5, 0.5), exec5.5)
ld1
Z<-predict(ld1)
newg<-Z$class
table<-table(g=exec5.5$g, newg)
round(prop.table(table, 1), 3)
exec5.5a<-read.table("R_operate/data_csv/exec5.5a.csv", header=T, sep=",") #读取新样品的文本文件
exec5.5a
newZ<-predict(ld1, exec5.5a)
newZ
#(2)#
p1<-0.3; p2<-0.7
ld2<-lda(g~x1+x2, prior=c(p1, p2), exec5.5) #先验概率不相等的线性判别
ld2
newZ<-predict(ld2, exec5.5a) #预测新样品所属类别
newZ
#(3)#
ex1<-exec5.5[exec5.5$g=="1", 1:2]
ex2<-exec5.5[exec5.5$g=="2", 1:2]
mean1<-apply(ex1, 2, mean)
mean2<-apply(ex2, 2, mean)
mean<-(mean1+mean2)/2
mean
S1<-cov(ex1)
S2<-cov(ex2)
Sp<-((n1-1)*S1+(n2-1)*S2)/(n1+n2-2)
a<-solve(Sp)%*%(mean1-mean2)
a
Wx0<-t(a)%*%(x0-mean)
Wx0
log(p2/3/p1)

##习题5.6##
exec5.6<-read.table("R_operate/data_csv/exec5.6.csv", header=T, sep=",")
exec5.6
library(MASS)
#(1)#
ld1<-lda(g~x1+x2+x3+x4+x5+x6, prior=c(0.5, 0.5), exec5.6)
ld1
exec5.6a<-read.table("R_operate/data_csv/exec5.6a.csv", header=T, sep=",") #读取新样品的文本文件
exec5.6a
newZ<-predict(ld1, exec5.6a)
newZ$class
qd1<-qda(g~x1+x2+x3+x4+x5+x6, prior=c(0.5, 0.5), exec5.6) #二次判别
qd1
newZ<-predict(qd1, exec5.6a) #根据二次判别函数预测新样品的所属类别
newZ$class
#(2)#
Z<-predict(ld1) #根据线性判别函数预测所属类别
newg<-Z$class
table1<-table(g=exec5.6$g, newg)
round(prop.table(table1, 1), 3)
ld2<-lda(g~x1+x2+x3+x4+x5+x6, prior=c(0.5, 0.5), CV=T, exec5.6) #采用交叉验证法
newg<-ld2$class
table2<-table(g=exec5.6$g, newg)
round(prop.table(table2, 1), 3)
qd1<-qda(g~x1+x2+x3+x4+x5+x6, prior=c(0.5, 0.5), exec5.6) #二次判别
qd1
Z<-predict(qd1) #根据二次判别函数预测所属类别
newg<-Z$class
table3<-table(g=exec5.6$g, newg)
round(prop.table(table3, 1), 3)
qd2<-qda(g~x1+x2+x3+x4+x5+x6, prior=c(0.5, 0.5), CV=T, exec5.6) #使用交叉验证法
newg<-qd2$class
table4<-table(g=exec5.6$g, newg)
round(prop.table(table4, 1), 3)
#(3)#
ld1<-lda(g~x1+x2+x3+x4+x5+x6, prior=c(0.8, 0.2), exec5.6)
newZ<-predict(ld1, exec5.6a) #预测新样品所属类别
newZ$class

##习题5.8##
exec5.8<-read.table("R_operate/data_csv/exec5.8.csv", header=T, sep=",")
exec5.8
library(MASS)
ld<-lda(g~x1+x2+x3+x4+x5+x6+x7+x8, exec5.8) #可显示费希尔判别系数及特征值结果
ld
Z<-predict(ld)
plot(Z$x, cex=1.5) #作散点图
text(Z$x[, 1], Z$x[, 2], cex=0.5, exec5.8$g) #为散点标号

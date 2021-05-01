#*******************************************************
#*******《应用多元统计分析》（第五版）R代码 ********
#****************** 王学民   2021.2 ********************
#从https://anyshare.sufe.edu.cn/#/link/B9F2F217DF9A179950462AF6B590145F下载《应用多元统计分析》（第五版）配书资料，下载的资料中有一个“《应用多元统计分析》（第五版）文本数据（以逗号为间隔）”的文件夹#
#假定数据存储目录为“C:/mvdata/”#
#*******************************************************


###第四章###

##例4.2.1##
examp4.2.1<-read.table("R_operate/data_csv/examp4.2.1.csv", header=T, sep=",") #读取文本文件
examp4.2.1
n<-6; p<-3; mu0<-c(90, 58, 16)
meanx<-apply(examp4.2.1, 2, mean) #计算列均值
meanx
Tsquare<-n*t(meanx-mu0)%*%solve(cov(examp4.2.1))%*%(meanx-mu0) #计算T方统计量
Tsquare
F<-(n-p)/p/(n-1)*Tsquare
pvalue<-1-pf(F, p, n-p) #计算p值
pvalue

##例4.2.2##
examp4.2.2<-read.table("R_operate/data_csv/examp4.2.2.csv", header=T, sep=",")
examp4.2.2
n<-8; p<-2; k<-p; alpha<-0.1
meanx<-apply(examp4.2.2, 2, mean)
meanx
S<-cov(examp4.2.2)
S
solve(S)
Talpha<-sqrt(p*(n-1)/(n-p)*qf(1-alpha, p, n-p)) #计算T方分位数的平方根
Talpha
l1<-meanx[1]-Talpha*sqrt(S[1, 1]/n)
u1<-meanx[1]+Talpha*sqrt(S[1, 1]/n)
c(l1, u1) #置信区间
l2<-meanx[2]-Talpha*sqrt(S[2, 2]/n)
u2<-meanx[2]+Talpha*sqrt(S[2, 2]/n)
c(l2, u2)
talpha_2k<-qt(1-alpha/(2*k), n-1) #计算t分位数
talpha_2k
l3<-meanx[1]-talpha_2k*sqrt(S[1, 1]/n)
u3<-meanx[1]+talpha_2k*sqrt(S[1, 1]/n)
c(l3, u3)
l4<-meanx[2]-talpha_2k*sqrt(S[2, 2]/n)
u4<-meanx[2]+talpha_2k*sqrt(S[2, 2]/n)
c(l4, u4)

##例4.3.1##
examp4.3.1<-read.table("R_operate/data_csv/examp4.3.1.csv", header=T, sep=",")
examp4.3.1
library(MASS) #加载MASS包
attach(examp4.3.1) #将数据框添加到R的搜索路径中
g<-factor(sex) #转换为因子
y<-cbind(x1, x2, x3)
fit<-manova(y~sex) #多元方差分析
summary(fit) #结果概要
detach(examp4.3.1) #将数据框从搜索路径中移除

##例4.4.2##
examp4.4.2<-read.table("R_operate/data_csv/examp4.4.2.csv", header=T, sep=",")
examp4.4.2
n1<-30; n2<-30; p<-4
attach(examp4.4.2)
ex1<-examp4.4.2[g=="1", 1:4]
ex2<-examp4.4.2[g=="2", 1:4]
mean1<-apply(ex1, 2, mean)
mean1
mean2<-apply(ex2, 2, mean)
mean2
S1<-cov(ex1)
S2<-cov(ex2)
Sp<-((n1-1)*S1+(n2-1)*S2)/(n1+n2-2)
Sp
detach(examp4.4.2)
C<-matrix(c(-1, 0, 0, 1, -1, 0, 0, 1, -1, 0, 0, 1), nrow=3)
#(1)#
Tsquare1<-(n1*n2/(n1+n2))*t(C%*%(mean1-mean2))%*%solve(C%*%Sp%*%t(C))%*% (C%*%(mean1-mean2))
Tsquare1
F1<-(n1+n2-p)/(p-1)/(n1+n2-2)*Tsquare1
pvalue1<-1-pf(F1, p-1, n1+n2-p)
pvalue1
#(2)#
e<-rep(1, p) #创建一个元素均为1的p维向量
Tsquare2<-(n1*n2/(n1+n2))*(t(e)%*%(mean1-mean2))^2/(t(e)%*%Sp%*%e)
Tsquare2
pvalue2<-1-pf(Tsquare2, 1, n1+n2-2)
pvalue2
#(3)#
mean<-apply(examp4.4.2[1:4], 2, mean)
S<-cov(examp4.4.2[1:4])
Tsquare3<-(n1+n2)*t(C%*%mean)%*%solve(C%*%S%*%t(C))%*%(C%*%mean)
Tsquare3
F3<-(n1+n2-p+1)/(p-1)/(n1+n2-1)*Tsquare3
pvalue3<-1-pf(F3, p-1, n1+n2-p+1)
pvalue3

##例4.5.1##
examp4.5.1<-read.table("R_operate/data_csv/examp4.5.1.csv", header=T, sep=",")
examp4.5.1
library(MASS)
attach(examp4.5.1)
g<-factor(g)
y<-cbind(x1, x2, x3, x4)
fity<-manova(y~g)
summary(fity)
summary.aov(fity)
z<-cbind(x1, x2, x3)
fitz<-manova(z~g)
summary(fitz)
detach(examp4.5.1)

##例4.6.1##
examp4.5.1<-read.table("R_operate/data_csv/examp4.5.1.csv", header=T, sep=",")
p<-4; k<-3; n1<-20; n2<-20; n3<-20
n<-n1+n2+n3
S1<-cov(examp4.5.1[g=="1", 1:4])
S2<-cov(examp4.5.1[g=="2", 1:4])
S3<-cov(examp4.5.1[g=="3", 1:4])
Sp<-((n1-1)*S1+(n2-1)*S2+(n3-1)*S3)/(n-k)
M<-(n-k)*log(det(Sp))-(n1-1)*log(det(S1))-(n2-1)*log(det(S2))-(n3-1)*log(det(S3))
c<-(1/(n1-1)+1/(n2-1)+1/(n3-1)-1/(n-k))*(2*p^2+3*p-1)/(6*(p+1)*(k-1))
u<-(1-c)*M
u
pvalue<-1-pchisq(u, (k-1)*p*(p+1)/2)
pvalue

##习题4.1##
exec4.1<-read.table("R_operate/data_csv/exec4.1.csv", header=T, sep=",")
exec4.1
n<-20; p<-3; alpha<-0.05
#(1)#
mu0<-c(4, 50, 10)
meanx<-apply(exec4.1, 2, mean)
meanx
S<-cov(exec4.1)
solve(S)
Tsquare<-n*t(meanx-mu0)%*%solve(cov(exec4.1))%*%(meanx-mu0)
F<-(n-p)/p/(n-1)*Tsquare
F
pvalue<-1-pf(F, p, n-p)
pvalue
#(2)#
Tsqalpha<-p*(n-1)/(n-p)*qf(1-alpha, p, n-p) #计算T方分位数
Tsqalpha
#(3)#
k<-p
Talpha<-sqrt(Tsqalpha)
Talpha
l1<-meanx[1]-Talpha*sqrt(S[1, 1]/n)
u1<-meanx[1]+Talpha*sqrt(S[1, 1]/n)
c(l1, u1)
l2<-meanx[2]-Talpha*sqrt(S[2, 2]/n)
u2<-meanx[2]+Talpha*sqrt(S[2, 2]/n)
c(l2, u2)
l3<-meanx[3]-Talpha*sqrt(S[3, 3]/n)
u3<-meanx[3]+Talpha*sqrt(S[3, 3]/n)
c(l3, u3)
talpha_2k<-qt(1-alpha/(2*k), n-1)
talpha_2k
l4<-meanx[1]-talpha_2k*sqrt(S[1, 1]/n)
u4<-meanx[1]+talpha_2k*sqrt(S[1, 1]/n)
c(l4, u4)
l5<-meanx[2]-talpha_2k*sqrt(S[2, 2]/n)
u5<-meanx[2]+talpha_2k*sqrt(S[2, 2]/n)
c(l5, u5)
l6<-meanx[3]-talpha_2k*sqrt(S[3, 3]/n)
u6<-meanx[3]+talpha_2k*sqrt(S[3, 3]/n)
c(l6, u6)

##习题4.2##
exec4.2<-read.table("R_operate/data_csv/exec4.2.csv", header=T, sep=",")
exec4.2
library(MASS)
attach(exec4.2)
g<-factor(g)
y<-cbind(x1, x2, x3)
fit<-manova(y~g)
summary(fit)
summary.aov(fit)
detach(exec4.2)

##习题4.5##
examp4.2.1<-read.table("R_operate/data_csv/examp4.2.1.csv", header=T, sep=",")
n<-6; p<-3; k<-p-1
C<-matrix(c(2, 1, -3, 0, 0, -6), nrow=2)
meanx<-apply(examp4.2.1, 2, mean)
S<-cov(examp4.2.1)
Tsquare<-n*t(C%*%meanx)%*%solve(C%*%S%*%t(C))%*%(C%*%meanx)
F<-(n-k)/k/(n-1)*Tsquare
F
pvalue<-1-pf(F, k, n-k)
pvalue

##习题4.7##
exec4.7<-read.table("R_operate/data_csv/exec4.7.csv", header=T, sep=",")
exec4.7
n1<-5; n2<-5; p<-5; k<-p-1
C<-matrix(c(1, 0, 0, 0, -1, 1, 0, 0, 0, -1, 1, 0, 0, 0, -1, 1, 0, 0, 0, -1), nrow=4)
attach(exec4.7)
ex1<-exec4.7[g=="1", 1:5]
ex2<-exec4.7[g=="2", 1:5]
mean1<-apply(ex1, 2, mean)
mean2<-apply(ex2, 2, mean)
S1<-cov(ex1)
S2<-cov(ex2)
Sp<-((n1-1)*S1+(n2-1)*S2)/(n1+n2-2)
detach(exec4.7)
Tsquare<-(n1*n2/(n1+n2))*t(C%*%(mean1-mean2))%*%solve(C%*%Sp%*%t(C))%*% (C%*%(mean1-mean2))
Tsquare
F<-(n1+n2-k-1)/k/(n1+n2-2)*Tsquare
F
pvalue<-1-pf(F, k, n1+n2-k-1)
pvalue

##习题4.8##
n1<-30; n2<-30; p<-4
meanx<-c(6.833, 7.033, 3.967, 4.700)
meany<-c(6.633, 7.000, 4.000, 4.533)
Sp<-matrix(c(0.606, 0.262, 0.066, 0.161, 0.262, 0.637, 0.173, 0.143, 0.066, 0.173, 0.810, 0.029, 0.161, 0.143, 0.029, 0.306), nrow=4)
C<-matrix(c(-1, 0, 0, 1, -1, 0, 0, 1, -1, 0, 0, 1), nrow=3)
#(1)#
Tsquare1<-(n1*n2/(n1+n2))*t(C%*%(meanx-meany))%*%solve(C%*%Sp%*%t(C))%*% (C%*%(meanx-meany))
Tsquare1
F1<-(n1+n2-p)/(p-1)/(n1+n2-2)*Tsquare1
pvalue1<-1-pf(F1, p-1, n1+n2-p)
pvalue1
#(2)#
e<-rep(1, p)
Tsquare2<-(n1*n2/(n1+n2))*(t(e)%*%(meanx-meany))^2/(t(e)%*%Sp%*%e)
Tsquare2
pvalue2<-1-pf(Tsquare2, 1, n1+n2-2)
pvalue2

##习题4.9##
n1<-76; n2<-76; n3<-76; p<-3; k<-3
n<-n1+n2+n3
mean1<-c(441.16, 0.13, -3.36)
S1<-matrix(c(294.76, -0.60, -32.57, -0.60, 0.0013, 0.073, -32.57, 0.073, 4.23), nrow=3)
mean2<-c(505.97, 0.09, -4.57)
S2<-matrix(c(1596.18, -1.19, -91.05, -1.19, 0.001, 0.071, -91.05, 0.071, 5.76), nrow=3)
mean3<-c(432.51, 0.14, -3.31)
S3<-matrix(c(182.67, -0.42, -22.00, -0.42, 0.0012, 0.056, -22.00, 0.056, 3.14), nrow=3)
mean<-(mean1+mean2+mean3)/3
E<-(n1-1)*S1+(n2-1)*S2+(n3-1)*S3
H<-n1*(mean1-mean)%*%t(mean1-mean)+n2*(mean2-mean)%*%t(mean2-mean)+n3*(mean3-mean)%*%t(mean3-mean)
lambda<-det(E)/det(E+H)
lambda
F<-(n-k-p+1)*(1-sqrt(lambda))/p/sqrt(lambda)
F
pvalue<-1-pf(F, 2*p, 2*(n-k-p+1))
pvalue

##习题4.10##
exec4.10<-read.table("R_operate/data_csv/exec4.10.csv", header=T, sep=",")
exec4.10
library(MASS) #加载MASS包
attach(exec4.10)
g<-factor(g)
y<-cbind(x1, x2)
fit<-manova(y~g)
summary(fit)
detach(exec4.10)

##习题4.11##
n1<-76; n2<-76; n3<-76; p<-3; k<-3
n<-n1+n2+n3
S1<-matrix(c(294.76, -0.60, -32.57, -0.60, 0.0013, 0.073, -32.57, 0.073, 4.23), nrow=3)
S2<-matrix(c(1596.18, -1.19, -91.05, -1.19, 0.001, 0.071, -91.05, 0.071, 5.76), nrow=3)
S3<-matrix(c(182.67, -0.42, -22.00, -0.42, 0.0012, 0.056, -22.00, 0.056, 3.14), nrow=3)
Sp<-((n1-1)*S1+(n2-1)*S2+(n3-1)*S3)/(n-k)
M<-(n-k)*log(det(Sp))-(n1-1)*log(det(S1))-(n2-1)*log(det(S2))-(n3-1)*log(det(S3))
c<-(1/(n1-1)+1/(n2-1)+1/(n3-1)-1/(n-k))*(2*p^2+3*p-1)/(6*(p+1)*(k-1))
u<-(1-c)*M
u
pvalue<-1-pchisq(u, (k-1)*p*(p+1)/2)
pvalue

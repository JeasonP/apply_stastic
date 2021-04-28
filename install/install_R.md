# 数据分析开发环境配置

--------------------------

## 安装R

--------------------------

[R官网](https://www.r-project.org/)

镜像列表位置:

    /etc/apt/sources.list

在这个地方添加你要下载的地方.

[R-Studio官网](https://www.rstudio.com/products/rstudio/download/)

1.打开终端输入:

    sudo apt-get update

对安装文件sources.list的一个更新吧，因为我们前面添加了地址啊

2.然后在终端再输入:

    sudo apt-get install r-base

开始安装

3.终端输入:

    sudo apt-get install r-base-dev

设置手动更新,不让他自动更新

可能出现的错误:

如果提示：无法获得锁

     /var/lib/dpkg/lock-frontend - open（11-资源暂时不可用），

说明锁被占用了，可以通过以下方法解决：

一、重启Ubuntu系统；

二、解锁命令，输入后重启系统：

    sudo rm /var/cache/apt/archives/lock
    sudo rm /var/lib/dpkg/lock

***;

## 安装R-Studio

-----------;

1.首先去官网下载所需要的版本

2.终端输入:

    sudo apt-get install gdebi-core

下载安装工具

3.终端输入:

    sudo gdebi -n rstudio-1.2.1335-amd64.deb

开始安装本地的RStudio版本，注意将路径改成安装包所在的相对路径

这样就完成了R和R-Studio的安装

## R设置工作目录

首先在tools菜单栏下，点击global options选项

然后在default working directory 中可以修改默认工作路径，点browse修改工作路径

最后保存，重新打开Rstudio后工作路径就变成已修改的路径了。

## pycharm安装

1.首先下载安装包

2.到安装包目录下:

    tar zxf pychrm-community-2018.3.tar.gz       ##解压
    cd  pychrm-community-2018.3/bin
    ./pycharm.sh                                 ##运行pycharm安装脚本

即可完成安装

————————————————

版权声明：本文为CSDN博主「zy66996」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。

[原文链接](https://blog.csdn.net/weixin_44889616/article/details/93535725)

### pycharm创建快捷方式

终端输入：

    sudo gedit /usr/share/applications/Pycharm.desktop

粘贴模板：

    [Desktop Entry]
    Type=Application
    Name=Pycharm
    GenericName=Pycharm3
    Comment=Pycharm3:The Python IDE
    Exec=sh /opt/pycharm/bin/pycharm.sh      ps：这个是装的pycharm的路径   例如我的是/home/username/pycharm-2017.1.3/bin/pycharm.sh
    Icon=/opt/pycharm/bin/pycharm.png              ps：这个和上面一样只不过用pycharm.png代替pycharm.sh
    Terminal=pycharm
    Categories=Pycharm;

然后保存退出之后

在;

    /usr/share/applications

文件夹下,找到pycharm图标,然后将其拖到需要放置的位置即可

## git简单使用

安装git,并设置用户名和邮箱:

    $:git config --global user.name "Your Name"
    $:git config --global user.email "email@example.com"

如果用户名或邮箱输入错误需要重置，使用以下命令修改：

　　　　$ git config --global --replace-all user.name "用户名"  
　　　　$ git config --global --replace-all user.email "邮箱地址"

查看配置:

    git config --list

创建本地仓库:

    $ mkdir learngit
    $ cd learngit
    $ pwd
    /Users/michael/learngit

初始化仓库:

    $ git init
    Initialized empty Git repository in /Users/michael/learngit/.git/

连接码云:

    ssh-keygen -t rsa -C "xxxxx@xxxxx.com"        //生成秘钥 
    Generating public/private rsa key pair...
    三次回车即可生成 ssh key

    cat ~/.ssh/id_rsa.pub                         //显示秘钥
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6eNtGpNGwstc....

然后将秘钥填在gitee的:设置->SSH公钥->公钥的窗口中

然后使用

    ssh -T git@gitee.com


将仓库与远程仓库关联:

    git remote add origin git@github.com:michaelliao/learngit.git


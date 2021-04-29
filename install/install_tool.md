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

简单操作:

    git add     # 加入到暂存区
    git commit  # 提交到本地库
    git push    # 发送给远程库
    git add -A            //-A表示将所有文件的修改，文件的删除，文件的新建，都添加到暂存区。
    git commit -m "第一次提交"
    git push origin master   //最后推送到远程库，也就是Gitee上的项目里。

连接码云:

    ssh-keygen -t rsa -C "xxxxx@xxxxx.com"        //生成秘钥 
    Generating public/private rsa key pair...
    三次回车即可生成 ssh key

    cat ~/.ssh/id_rsa.pub                         //显示秘钥
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6eNtGpNGwstc....

然后将秘钥填在gitee的:设置->SSH公钥->公钥的窗口中

然后使用

    ssh -T git@gitee.com

来验证是否连接成功

将仓库与远程仓库关联:(你需要在远程仓库创建项目之后才能进行关联)

    git remote add origin git@github.com:michaelliao/learngit.git

    git remote add origin https://gitee.com/YourGiteeName/YourProjName.git 

当你使用git命令行与远程仓库关联之后,vscode会自动将这个项目与远程仓库连接,你就可以直接推送了.

推送到远程仓库:

    git push origin master

## VSCode连接gitee

点击 "文件 > 将文件夹(已经初始化的可被git管理的文件夹)添加到工作区 > E:/YourProjName/ "就完成了。

无需任何配置，VSCode自动获取.git配置实现代码管理： 发生变动的文件或代码会有颜色提示，而且可以对比前后改了哪些地方。

需要上传的时候： 点击+号，加入暂存； 在[ 消息 (按 Ctrl+Enter 提交) ]中输入commit注释； 点击同步图标，push出去。

如果发现中文乱码，我们修改一下配置文件编码，改为utf-8就好了

    git config --global gui.encoding utf-8

## linux任务栏

    1、关闭 xfce4-panel --quit
    2、关闭 pkill xfconfd
    3、删除（建议先备份） rm -rf ~/.config/xfce4/panel
    4、删除（建议先备份） rm -rf ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-panel.xml
    5、重新运行 /usr/lib/x86_64-linux-gnu/xfce4/xfconf/xfconfd 

Linux下vscode更新:
    $ sudo rm /etc/apt/preferences.d/nosnap.pref
    $ sudo apt update
    $ sudo apt install snapd
    $ snap install hello-world
    hello-world 6.4 from Canonical✓ installed
    $ hello-world
    Hello World!

### rpm、deb、tar.gz安装包的差别

rpm包-在redhat上的LINUX、SUSE、Fedora可以直接进行安装，不适用于Ubuntu；

deb包-适用于ubuntu ,双击安装；

tar.gz包-在所有的Linux版本中都能使用，安装过程如下：
（先解压，然后cd命令进入刚才解压的目录，再安装)

        cd /temp/*****.tar.gz/
        ./install
        根据提示输入“ENTER”或“安装目录”
————————————————
版权声明：本文为CSDN博主「茗君（Major_s）」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
[原文链接：](https://blog.csdn.net/qq_41375318/article/details/102004610)

## deb安装的软件包默认把软件放到哪个目录下面了

    比如你安装的软件是firefox.deb ,其它的软件也行，反正总有个软件名称。
    #sudo dpkg -L firefox
    就知道安装到哪个目录和有哪些文件了。
    #dpkg --contents firefox.deb 效果是一样，显示这个安装包下有哪些文件。
    #man dpkg for more.

## 如何在VScode中设置jupyter的运行文件路径

默认情况下，我们遵循工作目录的VSCode模式，而不是Jupyter模式。这意味着我们使用当前打开的工作区文件夹的根目录作为启动jupyter笔记本的当前工作目录。为了解决这个问题，你可以像redhatvicky提到的那样在笔记本代码中设置cwd，或者在下面的VSCode设置中更改默认的当前工作目录。在Python->数据科学->笔记本文件根目录因为您可以更改每个工作区的设置，所以当您仅在包含您的文件的工作区中工作时，您可以让它始终默认为特定位置.

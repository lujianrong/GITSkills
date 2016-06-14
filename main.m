//这是我第一次成功使用 github
//哈哈哈 好开森啊
//咕~~(╯﹏╰)b 
廖雪峰 git 由浅入深
http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000
安装 git 用xcode 自带的

* 安装之后执行
git config —global user.name “lujianrong”
git config —global user.email  “lujianrong_ios@126.com”
<因为 git 是分布是版本控制系统, 所以每个机器必须自报家门:名字和 email 地址>

* 创建版本库
cd  把文件拖到终端(路径)cd /Users/lujianrong/Desktop/GitSkills/Git_SKills
pwd 命令用于显示当前目录  /Users/lujianrong/Desktop/GitSkills/Git_SKills
git init  命令把这个目录变成 git 可以管理的仓库 
(如果没有看见. git 就用 ls -ah 命令查看)
git status 告诉你有文件被修改过
git diff      查看哪些内容改动了
git log --pretty=oneline   比 git log 格式更好看

* 版本回退
git reset —hard HEAD^
git reset —help 
git reset —hard HEAD^    回车       回到当前的版本()
git reflog 查看记录
git reset —hard  + 版本号(git reflog 查出来的) 回滚到指定的版本
git reset —hard HEAD^^ 回到两个版本以前
git reset —hard HEAD~3 回到3个版本前

* 撤销修改
1. 一种情况 修改后没有 git add (存放到暂存区)
git checkout -- readme.txt
2. 一种情况是已经 git add(存到暂存区) 了 但是没有git commit -m(提交到分支)
git reset HEAD readme.txt
git checkout -- readme.txt
3. 一种是不仅仅 git add 而且 git commit -m 
版本回撤 吧~~ 

* 删除文件
touch Person.h 添加Person.h文件
touch Person.h 删除 Person.h 文件

* 远程仓库
* 由于你的本地Git仓库和GitHub仓库之间的传输是通过SSH加密的
1. 创建SSH Key.
ssh-keygen -t rsa -C "lujianrong_ios@126.com" 一直回车就好

点“Add SSH Key”，填上任意Title，在Key文本框里粘贴id_rsa.pub文件的内容：
cat id_rsa.pub 拷贝全部内容
￼
http://blog.csdn.net/guoshenglong11/article/details/9363573

- 关联远程仓库
git remote add origin https://github.com/lujianrong/JRUnitTestsDemo.git 
git push -u origin master   
￼
* 从远程仓库克隆
git clone https://github.com/lujianrong/LJR
git
* 分支管理
* 创建与合并分支
git checkout -b v1                创建并且切换到 v1分支
git checkout master             切换到 master 分支
git merge v1                         把 v1分支合并到 master 分支
git branch -d v1                    删除 v1分支
git branch                            查看分支

* 解决冲突
当两个分支同时对同一个文件进行修改, 合并时会发生冲突 
<<<<<<< HEAD


没有妹纸, 只有 xxx
=======
哈哈哈哈, 有妹纸擦吗
>>>>>>> v1

手动删除
<<<<<<< HEAD
=======
>>>>>>> v1
然后在 git add .   git commit -m “xxx”

* 分支管理策略
通常合并分支时, 如果可能, GIt 会用 Fast forward 模式, 但这种模式下，删除分支后，会丢掉分支信息。
如果要强制禁用Fast forward模式，Git就会在merge时生成一个新的commit，这样，从分支历史上就可以看出分支信息 --no-ff方式的git merge：

git merge --no-ff -m "merge with no-ff" v1  以普通方式合并


* 查看分支历史
git log --graph --pretty=oneline --abbrev-commit
*   768e4b0 解决掉冲突
|\  
| * 047917c 有创建 v1分支
* | 85d3c6f  有切回 master
|/  
*   611a99e 合并
|\  
| * 675078f 有妹纸吗
* | a9bd3bd 没有妹纸
|/  
* 557cf60 Initial commit

* Bug 分支
你想创建一个分支issue-101来修复它，但是，等等，当前正在dev上进行的工作还没有提交：
并不是你不想提交，而是工作只进行到一半，还没法提交，预计完成还需1天时间。但是，必须在两个小时内修复该bug，怎么办？
幸好，Git还提供了一个stash功能，可以把当前工作现场“储藏”起来，等以后恢复现场后继续工作：
git stash

git stash list
stash@{0}: WIP on v1: 047917c 有创建 v1分支

git stash pop

* 多人协作
git remote  远程默认仓库名 origin
origin

git remote -v显示更详细的信息
git remote -v
origin	https://github.com/lujianrong/LJR (fetch)
origin	https://github.com/lujianrong/LJR (push)

推送分支
推送分支，就是把该分支上的所有本地提交推送到远程库。推送时，要指定本地分支，这样，Git就会把该分支推送到远程库对应的远程分支上
git push origin master
git push origin v1  推送指定分支




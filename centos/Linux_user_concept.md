Linux 用户和用户组概念 
====
##### 用户文件:/etc/passwd  root：x:0:0:root:/root:/bin/bash x:密码占位符 /root 用户目录  
##### 密码文件:/etc/shadow  root:$6$UhbYN.... 存放密码信息 但是并非明文 为加密后的密码 加密算法$id： $1:  MD5 $5:  SHA-256 $6:  SHA-51
##### 组信息  :/etc/group   kick：x:1000:   存放用户组文件 组名称:组密码|为空则不需要密码:组标识:组成员
##### 组的密码:/etc/gshadow   组名称:口令 开头为! 标识无法登陆:管理员:组群员列表 
> * 注意: 1. 用户的主组群并不把该用户作为成员列出 2. 用户的附属组群才把用户作为成员列出
##### 系统约定： centos6  uid: 0  特权用户 uid: 1~499   系统用户 uid: 500+    普通用户
##### 如果创建一个用户时，未指定任何组（主组或附加组），系统会创建一个和用户名相同的组作为用户的 Primary Group. 

![用户组](/Image/user_group.png)

> * -g -G 仅仅使用useradd 创建用户时使用
> * -g -G 指定的组必须存在
> * -g 主组就想自己的家一样 一般属于自己  附加组 类似你的学校和公司一般用于工作
----
##### /sbin/nologin 使用这个shell的用户就会被拒绝连接 一般用户http 邮件账号访问服务器

### 用户密码
> * root 用户可以为任何用户设置密码
> * 普通用户设置密码还需要原码 并且需要满足一定的密码安全策略. 而且只能给自己修改密码

#### Linux 所有的操作都是基于文件 如果你忘记了用户和用户组的命令 可以直接进入/etc/下面的各种文件中去修改就行
**`查看用户信息(此命令需安装： #yum install -y finger) `**

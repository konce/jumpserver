# README

#### 1. 安装expect在mac。brew install expect
#### 2. 用ssh无密码登录本地和跳板机。[ssh 免密码登录](http://chenlb.iteye.com/blog/211809)
#### 3. 下载本仓库，`tool.sh`中，定义自己的服务器、账户名、和对应的密码。并且最终软链到本地。就可以自由享受无密码登录到任何服务器。


#### 使用
1. `./tool.sh test 1` =>  登录测试服务器1
2. `./tool.sh test` =>  登录测试服务器前的跳板机
3. `./tool.sh pro 1` =>  登录线上服务器1

over.

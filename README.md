# Cloudreve-Docker
The docker of Cloudreve

## 中文简介

本容器基于redis:5-alpine基础镜像制作，在保证程序运行稳定的前提下，实现最小空间占用以及资源消耗

本容器的Cloudreve版本为Cloudreve-3.3.1，镜像最新版本为
```littleplus/cloudreve:3.3.1-sqlite```

### 容器特点
* 镜像大小仅70M左右，资源消耗极低
* 外挂程序运行目录，可以自行更新Cloudreve版本，修改配置文件
* 在初次使用时，会在/etc/cloudreve目录生成cloudreve二进制文件以及配置文件
* 在/etc/cloudreve/cloudreve.db不存在时，由cloudreve自行生成sqlite数据库，密码可以在docker logs里面看到
* web默认监听8080端口，请务必把此端口映射到主机上，否则无法访问
* 二进制文件、配置文件以及sqlite数据库文件存放于/etc/cloudreve文件夹下

### 快速开始

默认前提：已经安装好docker并使docker服务正常运行中

1. git clone本项目或下载项目压缩包
2. 运行scripts/下的start.sh脚本，保存管理员用户名及密码信息（仅在初次创建数据库时显示）
3. 默认会将cloudreve本体、配置文件、数据库存放到/etc/cloudreve，将宿主机/data/cloudreve绑定到容器/data
4. 在cloudreve内修改默认存储策略中的存储路径为
```
/data/uploads/{uid}/{path}
```

### Q&A

1. 忘记保存初始密码了怎么办
删除/etc/cloudreve/cloudreve.db文件（会丢失原有文件记录），运行scripts/的start.sh，会重新生成密码

2. 如何升级Cloudreve
备份/etc/cloudreve文件夹，将新版Cloudreve二进制程序替换/etc/cloudreve的cloudreve文件，运行
```
docker restart cloudreve
```
重启容器生效

3. 如何修改Cloudreve基础配置
修改/etc/cloudreve/cloudreve.conf，运行
```
docker restart cloudreve
```
重启容器生效

4. 如何修改Cloudreve主机监听端口
修改scripts/start.sh，将左边的端口号替换为需要要监听的端口，运行scripts/start.sh生效

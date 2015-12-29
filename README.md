#### Install Sirius shell

```
git clone http://git.yunat.com/scm/scmc/sirius-shell.git
cd sirius-shell
sudo make install
```

#### 执行命令介绍
```
$ sirius
 usage: sirius <subcommand>

 Available subcommands are:
    build      	maven build and docker image build & push docker image.
    deploy   		deploy app to marathon.
    bootstrap   all execute git clone and build、deploy.
    version     print version"

 Try 'sirius <subcommand> help' for details.
```

##### sirius build
```
$ sirius build help
usage: sirius build <options>
功能说明:
  
  构建微服务，包含下载源代码，编译，打包，生成镜像，发布镜像
  需要预装git、maven、docker等工具
参数说明:
  -e  可选参数: environment。指定环境，例如：play|dev|qa|stage|prod。默认值：dev
  -s  可选参数: sandbox。指定沙箱，默认值：base
  -r  必选参数: repository url。指定程序项目仓库
  -b  可选参数: branch。指定程序分支，默认值：develop
  -T  可选参数: maven test。设置构建时是否跳过测试。默认值：true
  -D  可选参数: maven deploy。设置是否deploy到nexus仓库。默认值：false
```

##### siruis deploy
```
$ sirius deploy help
usage: sirius deploy <options>
功能说明:
  部署镜像到marathon
参数说明:
  -I  必选参数: image uri。设定docker镜像路径
  -e  可选参数: environment。指定环境，例如：play|dev|qa|stage|prod。默认值：dev
  -s  可选参数: sandbox。指定沙箱。默认值：base
  -r  必选参数: repository url。指定程序项目仓库
  -b  可选参数: branch。指定程序分支，默认值：develop
  -c  可选参数: cpu。用于设定cpu数量，单位：核心数. 不设置则从配置文件中读取
  -m  可选参数: memory。用于设定mem大小，单位：MB. 不设置则从配置文件中读取
  -i  可选参数: instance。用于设定instance个数，单位：个. 不设置则从配置文件中读取
```

##### sirius bootstrap
```
$ sirius bootstrap help
usage: sirius deploy <options>
功能说明:
  构建并发布微服务，包含下载源代码，编译，打包，生成镜像，发布镜像，发布到Marathon
  需要预装git、maven、docker等工具
参数说明:
  -e  可选参数: environment。指定环境，例如：play|dev|qa|stage|prod。默认值：dev
  -s  可选参数: sandbox。指定沙箱，默认值：base
  -r  必选参数: repository url。指定程序项目仓库
  -b  可选参数: branch。指定程序分支，默认值：develop
  -T  可选参数: maven test。设置构建时是否跳过测试。默认值：true
  -D  可选参数: maven deploy。设置是否deploy到nexus仓库。默认值：false
  -c  可选参数: cpu。用于设定cpu数量，单位：核心数. 不设置则从配置文件中读取
  -m  可选参数: memory。用于设定mem大小，单位：MB. 不设置则从配置文件中读取
  -i  可选参数: instance。用于设定instance个数，单位：个. 不设置则从配置文件中读取
```


### etcd shell 

#### Install

##### Install jq to parse json

[jq website](https://stedolan.github.io/jq/)

##### Install etcd shell

```bash
# git clone https://github.com/yangtao309/etcd-helper.git
# make install
# etcd 
# etcd viersion
```

#### Content 

*	etcd help
*	etcd version help
*	etcd add help
*	etcd update help
*	etcd delete help
*	etcd copy help

#### etcd

```bash
# etcd help
usage: etcd <subcommand>

Available subcommands are:
  copy     复制目录和文件
  add      新增目录和文件
  update   修改目录和文件
  delete   删除目录和文件
  version  打印etcd脚本版本号

Try 'etcd <subcommand> help' for details.
```

#### etcd version 

```bash
# etcd version help
usage: etcd version
功能说明:
  显示etcd脚本程序版本

# etcd version
This is etcd shell version, welcome!
1.0-rc
```

#### etcd add 

```bash
# etcd add help
usage: etcd add <options>
功能说明:
  增加目录或者文件
参数说明:
	-u	必选参数: url, 指定其请求url包含全路径. 例如: http://172.0.0.1:2379/v2/keys/dev/yangtao .
	-m	必选参数: mode, 指定其模式. 值类型: dir | key. 默认值key . 
	-v	可选参数: value, 指定其值. 若mode=key时必须指定其值，mode=directory时可选 .
```

##### 举个例子:

###### 增加一个新的key

```bash
# etcd add -u http://172.0.0.1:2379/v2/keys/qa/base/sirius/test.etcd.add -m key -v "hello world" 
```

###### 增加一个新的目录
```bash
# etcd add -u http://172.0.0.1:2379/v2/keys/qa/base/sirius/test -m directory
```

#### etcd update

```bash
# etcd update help
usage: etcd update <options>
功能说明:
  修改目录或者文件
参数说明:
  -u  必选参数: url, 指定其请求url包含全路径. 例如: http://172.0.0.1:2379/v2/keys/dev/yangtao .
  -m  必选参数: mode, 指定其模式. 值类型: dir | key. 默认值key . 
  -v  可选参数: value, 指定其值. 若mode=key时必须指定其值，mode=directory时可选 .
```

##### 举个例子:

###### 修改一个key的value值

```bash
# etcd update -u http://172.0.0.1:2379/v2/keys/qa/base/sirius/test.etcd.add -m key -v "updated value"
```

###### 修改一个目录名称

暂时还不支持，敬请期待下一个版本

#### etcd delete

```bash
# etcd delete help
usage: etcd delete <options>
功能说明:
  删除目录或者文件
参数说明:
  -u  必选参数: url, 指定其请求url包含全路径. 例如: http://127.0.0.1:2379/v2/keys/dev/yangtao .
```

##### 举个例子:

###### 删除一个key

```bash
# etcd delete -u http://127.0.0.1:2379/v2/keys/qa/base/sirius/test.etcd.add
```

###### 删除一个目录

```bash
# etcd delete -u http://127.0.0.1:2379/v2/keys/qa/base/sirius/test?dir=true
```

#### etcd copy

```bash
# etcd copy help
usage: etcd copy <options>
功能说明:
  复制目录或者文件
参数说明:
  -o  必选参数: origin url, 指定其源目录或者文件的url 例如: http://127.0.0.1:2379/v2/keys/dev/yangtao .
  -d  必选参数: dest url, 指定其目标目录或者文件的url 例如: http://127.0.0.1:2379/v2/keys/qa/yangtao .
```

##### 举个例子:

###### copy一个key

```bash
# etcd copy -o http://127.0.0.1:2379/v2/keys/dev/base/sirius/database.username -d http://127.0.0.1:2379/v2/keys/qa/base/sirius/database.username
```

###### 递归copy一个目录

```bash
# etcd copy -o http://127.0.0.1:2379/v2/keys/dev/base/sirius -d http://127.0.0.1:2379/v2/keys/qa/base/sirius
```


### etcd shell 

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
etcd add help
usage: etcd add <options>
功能说明:
  增加目录或者文件
参数说明:
	-u	必选参数: url, 指定其请求url包含全路径. 例如: http://172.18.2.164:2379/v2/keys/dev/yangtao .
	-m	必选参数: mode, 指定其模式. 值类型: dir | key. 默认值key . 
	-v	可选参数: value, 指定其值. 若mode=key时必须指定其值，mode=directory时可选 .
```

举个例子:

```bash
etcd add -u http://172.0.0.1:2379/v2/keys/qa/base/sirius/test.etcd.add -m key -v "hello world" 
```

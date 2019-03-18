# Hadoop Notes


## Some commonly used commands

查看集群上的分布式存储文件: 
```shell
$ hadoop fs -text {path-to-file} | head
```

将结果保存到本地文件系统(指的是连接hadoop集群的机器): 
```shell
$ hadoop fs -get {path-to-file} {save-path}
```
如果结果是多个parts: 
```shell
$ hadoop fs -getmerge {path-to-file-part*} {save-path}
```

Kill hadoop任务: 
```shell
$ hadoop job -kill {job_id}

$ yarn application -kill {application_id}
```

删除已有的Hadoop目标文件目录(当存在同样的目标目录时，hadoop执行时会自动放弃执行): 
```shell
$ hadoop fs -rm -r {path-to-folder}
```

Hadoop上的文件行数: 
```shell
$ hadoop fs -cat {path-to-file} | wc -l
```



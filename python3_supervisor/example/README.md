python 计划任务
---

目录结构: 
```
.
├── Config.py              配置文件
├── Dockerfile             Dockerfile 
├── Mysql.py               Mysql 操作封装
├── app.py                 启动文件
├── basic_images           基础镜像(可以忽律)
│   ├── Dockerfile
│   └── requirements.txt
├── docker                 docker 操作相关
│   ├── config.sh
│   ├── start.sh
│   └── supervisor
│       └── cron.conf
├── exec.py                 执行脚本
├── jfq.cfg                 配置文件
└── jfqutils.py             工具类
```

计划任务时间表
----

时间 | 描述
---|---
1:00 | 数据筛选
1:30 | 数据优化,分类获取,热度获取
9:00 | 优化后排名获取 



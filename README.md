# CloudCanal 客户端

- 目前支持 SaaS 版的客户端
- 由于 CloudCanal 没有明确客户端版本号，目前镜像版本以构建日期代替。建议使用时自己构建，客户端很容易过期。

## 构建方法：

1. 按文档下载 cloudcanal.tgz 到根目录并解压 https://www.clougence.com/cc-doc/business/operation/add_worker_self_maintain 解压完后会出现 cloudcanal 子目录
2. 在根目录运行 docker build .


## 使用方法：
1. 将 docker-compose.yml 放到根目录
1. 下载配置文件 `conf.properties`，放到根目录
2. `mkdir logs`
3. `chown -R 1000:1000 ./logs`
4. `docker compose up -d`

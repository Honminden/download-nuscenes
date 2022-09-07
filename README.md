使用：
1. 注册登录nuscenes.org
2. 获取自己的bearer token（通过F12等方式）
3. 将token写入 ./authkey
4. 更改 ./nuscenes_wget.sh & ./md5sum_all.sh 中的目标目录
5. 运行 ./nuscenes_wget.sh 下载文件

```bash
bash nuscenes_wget.sh
```
6. 运行 ./md5sum_all.sh 检查md5
```bash
bash md5sum_all.sh
```

usage: 
1. register and log in nuscenes.org
2. get bearer token (by F12 or anything else)
3. put the token in ./authkey
4. change target directory in ./nuscenes_wget.sh & ./md5sum_all.sh
5. run ./nuscenes_wget.sh to download files
```bash
bash nuscenes_wget.sh
```
6. run ./md5sum_all.sh to check md5
```bash
bash md5sum_all.sh
```

warning: please do not abuse the download script and destroy nuscenes data service
警告：请勿滥用下载脚本导致nuscenes数据服务受到破坏
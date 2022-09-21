#!/bin/bash

trap "stop" SIGTERM SIGINT SIGQUIT SIGHUP ERR

pidFile="/home/cloudcanal/cloudcanal/sidecar/bin/sidecar.pid"
logFile="/home/cloudcanal/logs/cloudcanal/sidecar/sidecar.log"

start(){
    ./sidecar/bin/startSidecar.sh
    read pid < $pidFile
    echo -e "pidFile $pidFile\npid ${pid}"
    if [ -n "${pid}" ];
    then
        tail --pid=$pid -F "$logFile" &
        # 直接用 tail 而不用 wait 会导致收不到 stop 信号
        # --pid 参数会等到 pid 结束后自动退出
        wait "${!}"
    fi
}

stop(){
    echo "stopping $pid"
    ./sidecar/bin/stopSidecar.sh
}

start

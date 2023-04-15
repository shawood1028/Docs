#!/bin/bash


result=date
echo $result

#获取命令运行结果的两种方式
result=`date`
echo $result

result=$(date)
echo $result
### logstash

#### 1.修改logstash时区
原因: elk默认时区为UTC,如果不做修改timestamp字段为UTC时间
https://cloud.tencent.com/developer/article/1860944
方法1:
logstash 中间 filter 环节处理
```yml
filter {
 ruby { 
   code => "event.set('timestamp', event.get('publish_time').time.localtime + 8*60*60)" 
 }
 ruby {
   code => "event.set('publish_time',event.get('timestamp'))"
 }
 mutate {
   remove_field => ["timestamp"]
 }
}
```
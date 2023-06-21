# kibana

1. 索引添加别名

```
POST _aliases
{
  "actions": [
    {
      "add": {
        "index": "prod-gateway-2023.06.07",
        "alias": "test_alias"
      }
    }
  ]
}
```

2. 查询索引信息

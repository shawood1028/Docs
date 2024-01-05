# 临时修改aws mysql时间
grant SYSTEM_VARIABLES_ADMIN on *.*  to 'admin';
flush privileges;

set global time_zone = `+8:00`;
set time_zone = `+8:00`;
flush privileges;
# 临时保存
choyee0616@163.com
Sherlocked#0616
# keys 操作可能造成长时间阻塞，生产环境勿用
redis-cli -p 3999 keys $1 | xargs redis-cli -p 3999 del

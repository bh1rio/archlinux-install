docker network create --subnet=172.18.0.0/16 cnet

docker run --name portainer --restart always -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer:1.22.2

docker run --name postgres \
-v /srv/docker/postgres/data:/var/lib/postgresql/data \
-v /etc/localtime:/etc/localtime:ro \
--net cnet \
--ip 172.18.0.2 \
-p 5432:5432 \
-e POSTGRES_PASSWORD=8206491 \
-e TZ=Asia/Shanghai \
--restart always \
-d postgres:12.0

docker run --name pgadmin4 \
--net cnet --ip 172.18.0.6 \
-v /etc/localtime:/etc/localtime:ro \
-e TZ=Asia/Shanghai \
-p 9080:80 \
-e "PGADMIN_DEFAULT_EMAIL=chiz@just4fun.cn" \
-e "PGADMIN_DEFAULT_PASSWORD=pass@word1" \
--restart always \
-d dpage/pgadmin4:4.14

docker run --name mariadb \
-v /srv/docker/mariadb/data:/var/lib/mysql \
-v /etc/localtime:/etc/localtime:ro \
-p 3306:3306 \
--net cnet \
--ip 172.18.0.3 \
-e MYSQL_ROOT_PASSWORD=8206491 \
-e TZ=Asia/Shanghai \
--restart always \
-d mariadb:10.4.8 \
--character-set-server=utf8mb4 \
--collation-server=utf8mb4_unicode_ci

docker run --name redis \
-v /srv/docker/redis/data:/data \
-v /etc/localtime:/etc/localtime:ro \
--net cnet \
--ip 172.18.0.4 \
-p 6379:6379 \
-e TZ=Asia/Shanghai \
--restart always \
-d redis:5.0.6

docker run --name=mongodb \
-v /etc/localtime:/etc/localtime:ro \
--net cnet \
--ip 172.18.0.5 \
-e TZ=Asia/Shanghai \
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=8206491 \
-p 27017:27017 \
--restart always \
-v /srv/docker/mongo/data:/data \
-d mongo:4.2.1

docker run --name rabbitmq \
-v /etc/localtime:/etc/localtime:ro \
-e TZ=Asia/Shanghai \
--net cnet \
--ip 172.18.0.7 \
-p 9081:15672 -p 15671:15671 \
--hostname seven \
--restart always \
-e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=8206491 \
-d rabbitmq:3.8.1-management

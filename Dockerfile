#基础镜像，如果本地没有，会从远程仓库拉取。
FROM harbor.openserver.cn:443/library/java:8

#在容器中创建挂载点，可以多个
VOLUME ["/tmp"]

#声明了容器应该打开的端口并没有实际上将它打开
EXPOSE 8080

ADD ./target/springboot-docker.jar app.jar
RUN bash -c 'touch /app.jar'

#指定容器启动时要执行的命令，但如果存在CMD指令，CMD中的参数会被附加到ENTRYPOINT指令的后面
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]

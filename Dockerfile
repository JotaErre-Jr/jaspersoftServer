FROM tomcat:8.5-jdk8-openjdk

# Copiar o arquivo WAR do Jaspersoft Server para o diretório webapps do Tomcat
COPY jasperserver.war /usr/local/tomcat/webapps/

# Mover a pasta webapps para webapps2
RUN mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2

# Renomear webapps.dist para webapps
RUN mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps

# Definir variáveis de ambiente necessárias para o Jaspersoft Server
ENV JAVA_OPTS="-Djava.awt.headless=true -Dfile.encoding=UTF-8 -server -Xms512m -Xmx2048m -XX:+UseG1GC"

# Expor a porta necessária para acessar o Jaspersoft Server (por padrão, porta 8080 do Tomcat)
EXPOSE 8080

# Comando para iniciar o Tomcat e o Jaspersoft Server
CMD ["catalina.sh", "run"]

FROM tomcat:9.0-jdk8-openjdk

# Instalar o pacote unzip
RUN apt-get update && apt-get install -y unzip

# Fazer o download do arquivo .zip do Jaspersoft Server diretamente no Dockerfile
RUN curl -o /tmp/TIB_js-jrs-cp_8.1.1_bin.zip -L "https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20Edition%20Service%20Pack%208.1.1/TIB_js-jrs-cp_8.1.1_bin.zip/download"

# Descompactar o arquivo .zip
RUN unzip /tmp/TIB_js-jrs-cp_8.1.1_bin.zip -d /usr/local/tomcat/webapps/jasperserver

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
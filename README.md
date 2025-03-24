<h1>Dependency</h1>

```
<dependency>
            <groupId>org.apache.tomcat.embed</groupId>
            <artifactId>tomcat-embed-jasper</artifactId>
        </dependency>


        <dependency>
            <groupId>jakarta.servlet.jsp.jstl</groupId>
            <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
        </dependency>

        <dependency>
            <groupId>org.glassfish.web</groupId>
            <artifactId>jakarta.servlet.jsp.jstl</artifactId>
        </dependency>
```
<h1>Application Properties</h1>

```
spring.application.name=final


spring.mvc.view.prefix=/jsp/
spring.mvc.view.suffix=.jsp
spring.datasource.url = jdbc:mysql://127.0.0.1:3306/anoch_blueshop?characterEncoding=utf-8
spring.datasource.username = root
spring.datasource.password = 
spring.jpa.show-sql = true
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.hibernate.ddl-auto = update
server.port=8080


spring.http.encoding.charset=UTF-8

spring.http.encoding.enabled=true

spring.http.encoding.force=true
```

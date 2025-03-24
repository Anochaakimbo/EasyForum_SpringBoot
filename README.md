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
        <dependency>
            <groupId>me.paulschwarz</groupId>
            <artifactId>spring-dotenv</artifactId>
            <version>4.0.0</version>
        </dependency>
```
<h1>Application Properties</h1>

```
spring.application.name=final


spring.mvc.view.prefix=/jsp/
spring.mvc.view.suffix=.jsp
spring.datasource.url = jdbc:mysql://${DATABASE_SERVER}/${DATABASE_NAME}?characterEncoding=utf-8
spring.datasource.username = ${DATABASE_USER}
spring.datasource.password = ${DATABASE_PASSWORD}
spring.jpa.show-sql = true
spring.jpa.properties.hibernate.format_sql=true
spring.jpa.hibernate.ddl-auto = update
server.port=8080


spring.http.encoding.charset=UTF-8

spring.http.encoding.enabled=true

spring.http.encoding.force=true
```
<h1>Application Env</h1>

```

สร้างไฟล์ .env ใน directory resources (ใน Eclipse จะไม่แสดงไฟล์ .env)
ถ้าอยากแก้ให้ไปแก้ที่ Root directory ของเครื่อง
ประกาศตัวแปรที่จะเก็บข้อมูล
DATABASE_SERVER=10.199.22.999999:3306
DATABASE_USER=root
DATABASE_PASSWORD=sc362102
DATABASE_NAME=javaweb_ch12
```

<h1>Create Your Spring JPA </h1>
<a> https://start.spring.io </a> 

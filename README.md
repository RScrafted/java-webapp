# Java WebApp

A lightweight Java Servlet/JSP web application packaged as a WAR for deployment to Apache Tomcat.

This repository is intended as a minimal Maven-based web application that can be built and deployed to a servlet container.

![webapp](<./images/webapp.png>)

## Project Structure

```plaintext
.
├── README.md
├── images
│   ├── tomcat-server.png
│   └── webapp.png
├── pom.xml
└── src
    └── main
        ├── java
        │   └── com
        │       └── rsstore
        │           ├── model
        │           │   └── Product.java
        │           └── servlet
        │               ├── CartServlet.java
        │               └── ProductServlet.java
        └── webapp
            ├── WEB-INF
            │   └── web.xml
            ├── cart.jsp
            ├── index.jsp
            └── products.jsp
```

## Prerequisites

- Java JDK
- Apache Maven
- Apache Tomcat 9


## Build

Build the WAR package.

```bash
mvn clean package
```

Output:

```bash
target/rs-shoe-apparel.war
```

## SCP Command

```bash
scp target/rs-shoe-apparel.war \
tomcat@<server-ip>:/path/to/apache-tomcat/webapps/
```

## Restart Tomcat

Restart your Tomcat service after copying the WAR.

```bash
sudo systemctl restart tomcat
```

If you're unsure of your Tomcat service name, list the available services:

```bash
systemctl list-units --type=service | grep -i tomcat
```

Then replace `tomcat` in the restart command with the appropriate service name (for example, `tomcat9` or a custom service name).

## Verify the App

![Tomcat Server](<./images/tomcat-server.png>)

## Clean up

```bash
mvn clean
```

# ☕ Java Servlets & JSP Study Guide & Cheat Sheet

---

## 🌐 What are Servlets?

- Java classes extending `HttpServlet`
- Handle HTTP requests (GET, POST) and generate responses (HTML)
- Part of Java EE (Jakarta EE)
- Run on a Servlet container (like Apache Tomcat)

---

## 🚀 First Servlet Example

```java
public class FirstServlet extends HttpServlet {
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.println("<html><body>It works...<hr></body></html>");
  }
}
```

---

## 📦 Servlet Setup

- Use **Tomcat** as servlet container
- Place `.class` servlet files in: `WEB-INF/classes/`
- Configure in `web.xml`:

```xml
<servlet>
  <servlet-name>MyServlet</servlet-name>
  <servlet-class>MyServletClass</servlet-class>
</servlet>
<servlet-mapping>
  <servlet-name>MyServlet</servlet-name>
  <url-pattern>/myurl</url-pattern>
</servlet-mapping>
```

---

## 🧰 Tomcat Structure

- `bin/`: startup and shutdown scripts
- `conf/`: configs (`server.xml`, `web.xml`)
- `lib/`: libraries
- `webapps/`: deployed applications
- `WEB-INF/`: contains `web.xml`, `classes/`, `lib/`

---

## 🌍 What is JSP?

- Java Server Pages (JSP): HTML + embedded Java
- Automatically compiled to a servlet by Tomcat
- Java code inside `<% ... %>` blocks

---

## 🔧 JSP Example

```jsp
<html>
<body>
<%
  out.println("First JSP… It works<br/>");
%>
</body>
</html>
```

- No need to configure in `web.xml` for basic JSPs
- Output is sent back to client as HTML

---

## 🛠 Running & Managing Tomcat

- Start: `bin/startup.bat`
- Stop: `bin/shutdown.bat`
- Access via browser: `http://localhost:8080`

---

## 📁 Format of a Web App

```
webapps/
└── myapp/
    ├── index.jsp
    └── WEB-INF/
        ├── web.xml
        ├── classes/
        └── lib/
```

---

## 📚 Resources

- [Tomcat](http://tomcat.apache.org/)
- Servlet Docs: http://www.cs.ubbcluj.ro/~florin/PDPJ/ExempleSurseDocumentatii/07JavaServlet.pdf
- JSP Docs: http://www.cs.ubbcluj.ro/~florin/PDPJ/ExempleSurseDocumentatii/08JavaServerPages.pdf

---

## FindU
### 基于JAVA EE入门的失物招领系统
- 2016年11月份花一个多月时间做的一个失物招领系统，使用的非常基础的J2EE技术，新手入门可参考
- 现已部署至阿里云服务器：http://112.74.63.151:8080/FindU/
    
    ![](https://github.com/Exrick/Exrick/blob/master/pics/FindU/QQ%E6%88%AA%E5%9B%BE20170915164407.png)

    ![](https://github.com/Exrick/Exrick/blob/master/pics/FindU/QQ%E6%88%AA%E5%9B%BE20170915164458.png)

    ![](https://github.com/Exrick/Exrick/blob/master/pics/FindU/QQ%E6%88%AA%E5%9B%BE20170915164529.png)

    ![](https://github.com/Exrick/Exrick/blob/master/pics/FindU/QQ%E6%88%AA%E5%9B%BE20170915164628.png)
    
### 所用技术

- JSP
- Servlet
- JDBC
- MySQL
- DBUtil：Apache的对JDBC简单封装的开源工具类库
- C3P0：数据库连接池
- Ajax
- Bootstrap
- HTML
- JavaScript
- CSS

### 本地开发运行部署
- 使用`MyEclipse`开发，导入打开项目即可
- 新建`findu`数据库，执行`findu.sql`文件(已有部分服务器中数据)
- 配置`Tomcat`服务器，访问相应端口+项目名即可，例如 http://localhost:8080/FindU/
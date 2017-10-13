## FindU
### 基于JAVA EE入门的失物招领系统
- 2016年11月份花一个多月时间做的一个失物招领系统，使用的非常基础的J2EE技术，新手入门可参考
- 后期可能会完善更多功能
- 现已部署至线上：http://findu.exrick.cn/
- 已实现功能：

- [x] 首页、个人中心、发布物品、申领物品、发布与申领管理、搜索查询、退出等模块
- [x] 在首页模块实现了模糊查询、分类查询等功能
- [x] 用户管理模块实现了登录、注册、修改、查看信息等功能
- [x] 个人中心模块实现了查看、删除、修改发布物品、处理申领等功能

    
    ![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170915164407.png)

    ![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170915164458.png)

    ![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170915164628.png)

    ![](http://oweupqzdv.bkt.clouddn.com/QQ%E6%88%AA%E5%9B%BE20170915164529.png)
    
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
- 新建`findu`数据库，执行`findu.sql`文件(已有部分服务器中数据)，在`src/dbinfo.properties`文件中配置你的数据库连接配置
- 配置`Tomcat`服务器，访问相应端口+项目名即可，例如 http://localhost:8080/FindU/
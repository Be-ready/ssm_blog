SSM整合开发：
    技术：Spring,SpringMVC,Mybatis

用户的请求处理：
    web---->Controller----->Service---->Dao---->DB数据库
            SpringMVC       <   Spring    >      Mybatis
spring容器和SpringMvc容器关系：
    从继承的角度看：SpringMVC容器是子类，Spring容器是父类，子类能访问父类，父类不能访问子类

spring容器对象是：WebApplicationContext
springMVC容器对象是：WebApplicationContext
springMVC容器对象有一个属性：parent,它的值是spring容器对象

SSM步骤：
1、新建数据库 表
2、新建Maven Web，并在pom.xml文件中导入相关坐标
    1）spring-webmvc
    2）mysql数据库，mysql-connector，数据源（druid/c3p0）
    3）spring-tx(事务管理器)
    3）mybatis,mybatis-spring
    5）javax-servlet-api
    6）jackson-core, jackson-databind
    7）在<build></build>指定Sources root目录中的xml/properties文件位置（整合mybatis时，会使用到xml）

3、修改web.xml文件：
    1）把web.xml改成高版本（3.1）
    1）配置SpringMvc的中央调度器(DispatcherServlet)
        配置springMvc.xml:
            1.声明注解驱动(<mvc:Annotation-config/>)
            2.开启注解扫描（<mvc:component-scan base-package="org.springframework.stereotype.Controller"></mvc:component-scan>）
                         (只包括controller)
            3.配置视图解析器(InternalResourceViewResolver)
    2）配置Spring的监听器(ContextLoaderListener)，并指定spring.xml位置
        配置spring.xml:
            1.声明注解扫描的包（不包括controller）
            2.配置数据源（c3p0/druid）
                1> url,root,password,driver可以用properties文件配置，此时要使用属性文件扫描
                   用法：<context:property-placeholder location="classpath:xxx.properties">
            3.配置SqlSessionFactoryBean(整合mybatis)（这里使用的是配置文件方式）
                1> 配置数据源（c3p0/druid）
                2> 指定mybatis全局配置文件位置（使用properties的configLocation属性）：
                    1》使用typeAliases元素给实体类取别名
                    2》使用mapper元素指定mapper接口所在的包（package属性）
                        注意：
                            1>> 配置文件方式时，mapper.xml要和mapper接口在同一目录下
                            2>> mapper接口名要和其对应的xxx.xml前缀相同
            4.配置mapper扫描器：
                使用properties的basePackage,value="mapper接口所在的包的全名"
    3）配置字符集过滤器(CharacterCharsetFilter )（解决post请求乱码问题）

ssm--个人博客项目：
数据库:ssm
表：
    user(用户表): uid, uname, upassword, sex, address, upid(用户上传的头像id)
    blog(博客表): bid, btitle, bcontent, bpid(发表的图片id), buid(该篇博客对应的用户id),
                 btaid(对应的标签id), btyid(对应的分类id), bviewnum(浏览次数), ctime(创建时间), utime(修改时间)
    comments(评论表): cid, ccontent, cbid(对应的博客id), cdate, c_parent_id, c_like_num
    pic(图片表): pid, purl(图片地址)
    labels(标签表): labelId, labelName, labelDescribe
    sorts(分类表): sortId, sortName(整体分类), sortDescribe, sortParentId

爬坑：
    1、注册时，使用User对象接收数据，form表单提交的file数据的name属性要和User中对应的属性名不一致，并且单独用MultiPartFIle 接收
    2、插入数据时立刻获得其主键
        <insert id="save" keyProperty="blogId" useGeneratedKeys="true" parameterType="blog">
解决方式：
    1、首页数据显示：（IndexService）
        博文部分
            博文标题，博文第一段内容，博文图片（一张），博文作者头像，发布时间，浏览量，标签类型（1-2个）
        标签部分
            标签名，属于该标签的博文总数
        分类部分
            分类名，属于该分类的博文总数
        最新推荐|最热推荐
            博文标题

读取target目录下的uploads存的图片
ResourceUtils.getURL("classpath:").getPath()

分页问题出现问题：
    1、上一页下一页添加单击事件，onclick="showBlog(currPage)",上一页时currPage-1，下一页时currPage+1
    2、函数showBlog中使用ajax
    2、xml中查询sql:
        <if test="currPage!=null and currPage>=0">
            select * from blog limit #{currPage}, #{size}
        </if>
















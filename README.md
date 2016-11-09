OIUE
=======

#Open Intelligent Unitive Efficient
##开放 智能 统一 高效
题外话：

	不知道你有没有修改开源项目的经历，好比在一锅乱炖里去捞所有的白菜，很多时候，需要把一锅都翻遍才能找出所有的白菜叶，我们希望倡导一种方式，完全遵循解耦的架构，从根本去解决这种一锅乱炖的局面。
	
	OIUE 开源的目的是推进轻量化、标准化、架构解耦、模块化以及去框架化，框架立足将模块切分最小粒度，确保每个模块均可单独替换、并最小限度模块依赖，开发者无需培训即可快速入手，亦不用关心底层架构、分布式服务调用及服务治理等相关繁琐复杂的实现。1.0版本框架采用了OSGI的底层容器，部分遵循OSGI标准，但模块Activator请严格遵循本项目，后续将推出多个版本的启动容器，以满足不同场景下业务需求，同时也欢迎有兴趣的朋友共同加入与探讨。
	
	作为程序开发人员，每天都在重复同样的工作，浪费了大量时间，严重影响了开发热情，简单而又重复的工作占用了我们太多的时间。程序语言由低级逐渐走向高级，出现了许多控件及框架，Java中spring等是很不错的框架，其应用广泛程度难有出其右者，但极其庞大的体系结构让人望而却步，笨重而又耦合的模块体系是在让人无法恭维，强制的调用及结构已经改变了语言原本的色彩，其本质并未从根本上解决程序开发中大量的重复工作，我们希望有一个工具或者一套设计，能够按照我们所习惯的操作模式，最大程度的复用、更高程度的解耦，延续一些开发偏好，以及更大的灵活性，不约定俗成的满足我们的开发需求，开放、智能、统一、高效，本软件框架构想由此应运而生。
	
	许多人会好奇为什么选择OSGI作运行容器，“OSGI架构师的天堂”这句话并不足以概括初衷，最重要的是，OSGI优秀的模块化结构，要求我们更加严谨，同时也让我们更加重视对封装、模块化的理解，模块应该尽可能减少对外界的依赖除非逼不得已，我见过太多原本应该最小实现却引用一大堆附加无用的功能的工具包，这里不一一列举，无力吐槽、仁者见仁智者见智吧，筑建一个开放、严谨、高效的开发群体，是本架构的初衷之一。
		
	
	从未见过哪个男人跟女生吵架能吵赢的，不是气急败坏地动起了手，就是沉默以对。这仅仅是男人的问题吗？达尔文说：“以前也有吵赢的，后来他们都找不到女朋友，于是灭绝了。”
	
	我们不希望出现类似与上面的故事，从前有一群很刻苦的人，由于没有时间恋爱，后来灭绝了！

下载主工程OIUE，修改oiue.sh内jre及工程目录，运行即可启动项目，开源库中提供了部分开放服务，可快捷搭建自己的各类应用服务。

**开源库及服务说明如下：**

开源库名称|描述
---|---
OIUE主工程（服务启动容器felix）|https://github.com/OIUE/OIUE
OIUE基于OSGI打包配置|https://github.com/OIUE/OIUE-CONFIGURATOR
OIUE核心服务（容器隔离及核心服务定义）|https://github.com/OIUE/OIUE-CORE
OIUE核心服务实现|https://github.com/OIUE/OIUE-BASE
OIUE基于jdbc事物封装|https://github.com/OIUE/OIUE-ODPS
OIUE开放服务|https://github.com/OIUE/OIUE-SERVICES

服务名称|纯接口|bundle
---|---|---
Action服务定义|Y|org.oiue.service.action.api-1.0.0.jar
Action调度服务实现|N|org.oiue.service.action.base-1.0.0.jar
ActionFilter认证服务|N|org.oiue.service.action.filter.auth-1.0.0.jar
免登陆调试服务|N|org.oiue.service.action.filter.auth.debug-1.0.0.jar
Action服务HTTP方式访问实现OLD|N|org.oiue.service.action.http.action-1.0.0.jar
HTTP图片验证码服务|N|org.oiue.service.action.http.imageCode-1.0.0.jar
Action服务HTTp方式访问实现NEW|N|org.oiue.service.action.http.services-1.0.0.jar
HTTP文件上传服务|N|org.oiue.service.action.http.upload-1.0.0.jar
Action服务TCP方式JSON访问实现|N|org.oiue.service.action.tcp.action-1.0.0.jar
Action服务TCP方式流访问实现|N|org.oiue.service.action.tcp.bytes-1.0.0.jar
认证服务定义|Y|org.oiue.service.auth-1.0.0.jar
认证调度服务实现|N|org.oiue.service.auth.impl-1.0.0.jar
本地认证服务实现(直接查jdbc库)|N|org.oiue.service.auth.local-1.0.0.jar
自定义缓存定义|Y|org.oiue.service.buffer-1.0.0.jar
自定义缓存实现|N|org.oiue.service.buffer.impl-1.0.0.jar
自定义缓存同步服务|N|org.oiue.service.buffer.synchronization.db-1.0.0.jar
流数据编解码处理服务定义|Y|org.oiue.service.bytes.api-1.0.0.jar
流数据编解码调度处理服务实现|N|org.oiue.service.bytes.base-1.0.0.jar
数据流编解码|N|org.oiue.service.bytes.bytes-1.0.0.jar
整形数据编解码|N|org.oiue.service.bytes.int16-1.0.0.jar
字符串编解码|N|org.oiue.service.bytes.string-1.0.0.jar
缓存服务定义|Y|org.oiue.service.cache-1.0.0.jar
自定义缓存实现|N|org.oiue.service.cache.buffer-1.0.0.jar
缓存调度实现|N|org.oiue.service.cache.impl-1.0.0.jar
混存redis封装|N|org.oiue.service.cache.jedis-1.0.0.jar
混存脚本操作|N|org.oiue.service.cache.script-1.0.0.jar
树状结构缓存定义|Y|org.oiue.service.cache.tree-1.0.0.jar
树状缓存脚本操作|N|org.oiue.service.cache.tree.script-1.0.0.jar
树状缓存zookeeper封装|N|org.oiue.service.cache.tree.zookeeper.curator-1.0.0.jar
缓存调试服务|N|org.oiue.service.debug.cache-1.0.0.jar
Http客户端调试服务|N|org.oiue.service.debug.httpclient-1.0.0.jar
资源操作调试服务|N|org.oiue.service.debug.res-1.0.0.jar
树状缓存调试服务|N|org.oiue.service.debug.treecache-1.0.0.jar
数据接入总线服务定义|Y|org.oiue.service.driver.api-1.0.0.jar
数据接入总线调度实现|N|org.oiue.service.driver.base-1.0.0.jar
数据总线过滤实现|N|org.oiue.service.driver.filter.impl-1.0.0.jar
数据总线订阅实现|N|org.oiue.service.driver.listener.impl-1.0.0.jar
数据总线存储实现|N|org.oiue.service.driver.listener.storage-1.0.0.jar
事件执行服务定义|Y|org.oiue.service.event.execute-1.0.0.jar
事件执行服务实现|N|org.oiue.service.event.execute.impl-1.0.0.jar
获取系统时间事件定义|Y|org.oiue.service.event.system.time-1.0.0.jar
获取系统时间事件实现|N|org.oiue.service.event.system.time.impl-1.0.0.jar
文件上传服务定义|Y|org.oiue.service.file.upload-1.0.0.jar
文件上传服务实现|N|org.oiue.service.file.upload.impl-1.0.0.jar
HTTP客户端服务定义|Y|org.oiue.service.http.client-1.0.0.jar
apacheHttp客户端封装|N|org.oiue.service.http.client.apache-1.0.0.jar
日志服务定义|Y|org.oiue.service.log-1.0.0.jar
日志Log4j封装|N|org.oiue.service.log4j-1.0.0.jar
消息服务定义|Y|org.oiue.service.message-1.0.0.jar
消息服务实现|N|org.oiue.service.message.impl-1.0.0.jar
JDBC事务基础服务|N|org.oiue.service.odp.base-1.0.0.jar
H2持久层底层公共方法定义|N|org.oiue.service.odp.dmo.h2-1.0.0.jar
Mysql持久层底层公共方法定义|N|org.oiue.service.odp.dmo.mysql-1.0.0.jar
Neo4j持久层底层公共方法定义|N|org.oiue.service.odp.dmo.neo4j-1.0.0.jar
Postgresql持久层底层公共方法定义|N|org.oiue.service.odp.dmo.postgresql-1.0.0.jar
数据操作事件定义|Y|org.oiue.service.odp.event.api-1.0.0.jar
数据操作事件Mysql实现|N|org.oiue.service.odp.event.dmo.mysql-1.0.0.jar
数据操作事件Mysql查询实现|N|org.oiue.service.odp.event.dmo.mysql.q-1.0.0.jar
数据操作事件Mysql单条查询实现|N|org.oiue.service.odp.event.dmo.mysql.select-1.0.0.jar
数据操作事件Mysql多条查询实现|N|org.oiue.service.odp.event.dmo.mysql.selects-1.0.0.jar
数据操作事件Mysql查询事件转换实现|N|org.oiue.service.odp.event.dmo.mysql.t-1.0.0.jar
数据操作事件Neo4j实现|N|org.oiue.service.odp.event.dmo.neo4j-1.0.0.jar
数据操作事件Neo4j插入实现|N|org.oiue.service.odp.event.dmo.neo4j.insert-1.0.0.jar
数据操作事件Postgresql实现|N|org.oiue.service.odp.event.dmo.postgresql-1.0.0.jar
数据操作事件Postgresql查询实现|N|org.oiue.service.odp.event.dmo.postgresql.q-1.0.0.jar
数据操作事件Postgresql查询实现|N|org.oiue.service.odp.event.dmo.postgresql.query-1.0.0.jar
数据操作事件Postgresql查询实现|N|org.oiue.service.odp.event.dmo.postgresql.selects-1.0.0.jar
事件sql处理定义|Y|org.oiue.service.odp.event.sql.structure-1.0.0.jar
事件sql处理实现|N|org.oiue.service.odp.event.sql.structure.impl-1.0.0.jar
资源操作服务定义|Y|org.oiue.service.odp.res.api-1.0.0.jar
资源操作服务业务实现|N|org.oiue.service.odp.res.base-1.0.0.jar
资源操作持久层定义|Y|org.oiue.service.odp.res.dmo-1.0.0.jar
H2资源操作持久层实现|N|org.oiue.service.odp.res.dmo.h2-1.0.0.jar
Mysql资源操作持久层实现|N|org.oiue.service.odp.res.dmo.mysql-1.0.0.jar
Neo4j资源操作持久层实现|N|org.oiue.service.odp.res.dmo.neo4j-1.0.0.jar
sql处理定义|Y|org.oiue.service.odp.structure-1.0.0.jar
sql处理实现|N|org.oiue.service.odp.structure.impl-1.0.0.jar
查询sql处理实现|N|org.oiue.service.odp.structure.selectsql-1.0.0.jar
在线维护服务定义|Y|org.oiue.service.online-1.0.0.jar
在线维护服务实现|N|org.oiue.service.online.impl-1.0.0.jar
启动容器隔离封装服务（基于OSGI）|N|org.oiue.service.osgi.rpc-1.0.0.jar
权限校验服务定义|Y|org.oiue.service.permission-1.0.0.jar
权限校验调度服务实现|N|org.oiue.service.permission.impl-1.0.0.jar
访问鉴权及转换服务|N|org.oiue.service.permission.verify-1.0.0.jar
JDBC连接池定义|Y|org.oiue.service.sql-1.0.0.jar
Apache的JDBC连接池封装|N|org.oiue.service.sql.apache-1.0.0.jar
系统分析服务定义|Y|org.oiue.service.system.analyzer-1.0.0.jar
系统分析服务实现|N|org.oiue.service.system.analyzer.impl-1.0.0.jar
定时任务调度服务定义|Y|org.oiue.service.task-1.0.0.jar
定时任务调度|N|org.oiue.service.task.quartz-1.0.0.jar
TCP/UDP服务定义|Y|org.oiue.service.tcp-1.0.0.jar
Mina封装|N|org.oiue.service.tcp.mina-1.0.0.jar
模板定义|Y|org.oiue.service.template.api-1.0.0.jar
模板管理服务实现|N|org.oiue.service.template.base-1.0.0.jar
beetl封装|N|org.oiue.service.template.beetl-1.0.0.jar
velocity封装|N|org.oiue.service.template.velocity-1.0.0.jar
线程池定义|Y|org.oiue.service.threadpool-1.0.0.jar
线程池实现|N|org.oiue.service.threadpool.impl-1.0.0.jar
工具包|N|org.oiue.tools-1.0.0.jar



**一个典型的服务Activator如下：**

```
package org.oiue.service.action.http.action;

import java.util.Dictionary;

import org.oiue.service.action.api.ActionService;
import org.oiue.service.log.LogService;
import org.oiue.service.log.Logger;
import org.oiue.service.osgi.FrameActivator;
import org.oiue.service.osgi.MulitServiceTrackerCustomizer;
import org.osgi.service.http.HttpService;

public class Activator extends FrameActivator {

    @Override
    public void start() throws Exception {
        this.start(new MulitServiceTrackerCustomizer() {
            private String url = getProperty("org.oiue.service.action.http.root") + "/action";
            private HttpService httpService;
            private PostServlet posServlet;

            @Override
            public void removedService() {
                httpService.unregister(url);
            }

            @Override
            public void addingService() {
                httpService = getService(HttpService.class);
                LogService logService = getService(LogService.class);
                ActionService actionService = getService(ActionService.class);

                posServlet = new PostServlet(actionService, logService);
                Logger log = logService.getLogger(this.getClass());
                if (log.isInfoEnabled()) {
                	log.info("绑定url：" + url);
				}
                try {
                    httpService.registerServlet(url, posServlet, null, null);
                } catch (Exception e) {
                    log.error(e.getMessage(), e);
                }
            }

            @Override
            public void updated(Dictionary<String, ?> props) {
                posServlet.updated(props);
            }
        }, HttpService.class, ActionService.class, LogService.class);
    }

    @Override
    public void stop() throws Exception {}
}
```
一个典型的Main工程Meavn实例如下：

```
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<packaging>pom</packaging>
	<name>Main</name>
	<groupId>org.oiue</groupId>
	<artifactId>main</artifactId>
	<version>1.0.0</version>
	<dependencies>
		<dependency>
			<groupId>${felix.groupId}</groupId>
			<artifactId>org.apache.felix.main</artifactId>
			<version>5.6.0</version>
		</dependency>
	</dependencies>
	<properties>
		<felix.groupId>org.apache.felix</felix.groupId>
		<obr.version>2.0.8</obr.version>
		<conf.version>1.8.8</conf.version>
		<http.servlet.api.version>1.1.2</http.servlet.api.version>
		<http.api.version>3.0.0</http.api.version>
		<log.version>1.0.1</log.version>
		<http.base.version>3.0.8</http.base.version>
		<jetty.version>3.1.2</jetty.version>
		<eventadmin.version>1.4.4</eventadmin.version>
		<webconsole.version>4.2.16</webconsole.version>
		<threaddump.version>1.0.0</threaddump.version>
		<oiue.groupId>org.oiue.services</oiue.groupId>
		<rpc.version>1.0.0</rpc.version>
		<oiue.version>1.0.0</oiue.version>
	</properties>
	<build>
		<plugins>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-dependency-plugin</artifactId>
				<executions>
					<execution>
						<id>copy-dependencies</id>
						<phase>initialize</phase>
						<goals>
							<goal>copy-dependencies</goal>
						</goals>
						<configuration>
							<outputDirectory>${project.basedir}/lib</outputDirectory>
							<overWriteReleases>false</overWriteReleases>
							<overWriteSnapshots>false</overWriteSnapshots>
							<overWriteIfNewer>true</overWriteIfNewer>
						</configuration>
					</execution>
				</executions>
			</plugin>
			<plugin>
				<groupId>org.apache.maven.plugins</groupId>
				<artifactId>maven-dependency-plugin</artifactId>
				<executions>
					<execution>
						<id>copy</id>
						<phase>package</phase>
						<goals>
							<goal>copy</goal>
						</goals>
						<configuration>
							<artifactItems>
								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.bundlerepository</artifactId>
									<version>${obr.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.configadmin</artifactId>
									<version>${conf.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.webconsole</artifactId>
									<version>${webconsole.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.threaddump</artifactId>
									<version>${threaddump.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>

								<artifactItem>
									<groupId>org.oiue</groupId>
									<artifactId>tools</artifactId>
									<version>${rpc.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>

								<!--http://git.oschina.net/every.oschina.net/OIUE/blob/master/conf/org/oiue/service/osgi/rpc/Activator.config?dir=0&filepath=conf%2Forg%2Foiue%2Fservice%2Fosgi%2Frpc%2FActivator.config&oid=b4936393daf0fcae071facca5582a143c83fae35&sha=dde2dfae5c8b802e6d53f26186c2682eba29439b-->
								<!--https://github.com/OIUE/OIUE/blob/master/conf/org/oiue/service/osgi/rpc/Activator.config-->
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.osgi.rpc</artifactId>
									<version>${rpc.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.cache.tree</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.log</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.system.analyzer</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<!--http://git.oschina.net/every.oschina.net/OIUE/blob/master/conf/org/oiue/service/cache/tree/zookeeper/curator/Activator.config?dir=0&filepath=conf%2Forg%2Foiue%2Fservice%2Fcache%2Ftree%2Fzookeeper%2Fcurator%2FActivator.config&oid=14ef50b79711019c20901e21d1e4dec05b32205d&sha=dde2dfae5c8b802e6d53f26186c2682eba29439b-->
								<!--https://github.com/OIUE/OIUE/blob/master/conf/org/oiue/service/cache/tree/zookeeper/curator/Activator.config-->
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.cache.tree.zookeeper.curator</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<!--http://git.oschina.net/every.oschina.net/OIUE/blob/master/conf/org/oiue/service/log4j/Activator.config?dir=0&filepath=conf%2Forg%2Foiue%2Fservice%2Flog4j%2FActivator.config&oid=22a413a2982e247e8be25bda2e85c1fedf8953e1&sha=dde2dfae5c8b802e6d53f26186c2682eba29439b-->
								<!--https://github.com/OIUE/OIUE/blob/master/conf/org/oiue/service/log4j/Activator.config-->
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.log4j</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.system.analyzer.impl</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.sql</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<!--http://git.oschina.net/every.oschina.net/OIUE/blob/master/conf/org/oiue/service/sql/apache/Activator.config?dir=0&filepath=conf%2Forg%2Foiue%2Fservice%2Fsql%2Fapache%2FActivator.config&oid=837a39c8bad5e2da9a4b58565362b15241537692&sha=dde2dfae5c8b802e6d53f26186c2682eba29439b-->
								<!--https://github.com/OIUE/OIUE/blob/master/conf/org/oiue/service/sql/apache/Activator.config-->
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.sql.apache</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>

								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.http.servlet-api</artifactId>
									<version>${http.servlet.api.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.http.api</artifactId>
									<version>${http.api.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.log</artifactId>
									<version>${log.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.http.base</artifactId>
									<version>${http.base.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.eventadmin</artifactId>
									<version>${eventadmin.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${felix.groupId}</groupId>
									<artifactId>org.apache.felix.http.jetty</artifactId>
									<version>${jetty.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.buffer</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.buffer.impl</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.cache</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.cache.impl</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.cache.jedis</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.cache.script</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.debug.cache</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.cache.buffer</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.online</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<!--http://git.oschina.net/every.oschina.net/OIUE/blob/master/conf/org/oiue/service/odp/res/base/Activator.config?dir=0&filepath=conf%2Forg%2Foiue%2Fservice%2Fodp%2Fres%2Fbase%2FActivator.config&oid=758fe3ff79aaacfb040e969039304ef952df90c3&sha=dde2dfae5c8b802e6d53f26186c2682eba29439b-->
								<!--https://github.com/OIUE/OIUE/blob/master/conf/org/oiue/service/online/impl/Activator.config-->
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.online.impl</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}.actions</groupId>
									<artifactId>org.oiue.service.action.api</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.permission</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.auth</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}.actions</groupId>
									<artifactId>org.oiue.service.action.base</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.actions</groupId>
									<artifactId>org.oiue.service.action.filter.auth</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.permission.impl</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.auth.impl</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.base</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.dmo.h2</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.dmo.mysql</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.dmo.postgresql</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.dmo.neo4j</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.res.dmo</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.res.dmo.h2</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.res.dmo.mysql</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.res.dmo.neo4j</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.res.api</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.api</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.sql.structure</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.structure</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.structure.impl</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.structure.selectsql</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.sql.structure.impl</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.mysql</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.mysql.q</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.mysql.t</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.mysql.select</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.mysql.selects</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.postgresql</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.postgresql.q</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.postgresql.query</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.postgresql.selects</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.neo4j</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.odps.events</groupId>
									<artifactId>org.oiue.service.odp.event.dmo.neo4j.insert</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								
								<artifactItem>
									<groupId>${oiue.groupId}.odps</groupId>
									<artifactId>org.oiue.service.odp.res.base</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.permission.verify</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.auth.local</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.actions</groupId>
									<artifactId>org.oiue.service.action.http.services</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.actions</groupId>
									<artifactId>org.oiue.service.action.http.upload</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}.actions</groupId>
									<artifactId>org.oiue.service.action.tcp.action</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.file.upload</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.file.upload.impl</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.task</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.task.quartz</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.buffer.synchronization.db</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.tcp</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>
								<artifactItem>
									<groupId>${oiue.groupId}</groupId>
									<artifactId>org.oiue.service.tcp.mina</artifactId>
									<version>${oiue.version}</version>
									<type>jar</type>
									<overWrite>true</overWrite>
									<outputDirectory>${project.basedir}/bundle</outputDirectory>
								</artifactItem>

							</artifactItems>
						</configuration>
					</execution>
				</executions>
			</plugin>
		</plugins>
	</build>
</project>
```

# HTTP/TCP/UDP字符流请求/响应格式规范定义

服务平台开放式服务接收客户端采用TCP、HTTP等方式调用。本章节规范并定义本平台开放式服务的标准请求/响应格式，并为非开放式服务及特定业务服务提供协议参考。
后续章节均以TCP交互为例，HTTP方式请求请参考本章节泛化。

## 客户端TCP/UDP调用服务外层格式定义

TCP/UDP字符流方式调用服务采用JSON格式的数据请求，经过相应处理转换为java原生对象传给后端服务及服务池。

**请求格式定义：**

```
{
	“modulename”: “queryCar”,
	“operation”: ““,
	[ “version”: ““,]
	“tag”: “12345”,
	“tokenid:” ““,
	[“processkey”: ““, ] 
	[“encrypt”: ““, ] 
	[“debug”: ““, ] 
	“data”: {}
}
```
其中：
**modulename** 标识客户端调用模块名称
**operation** 标识客户端操作
**version** 模块版本，默认为最新版本，非必选
**tag**标识客户端处理响应标记，请求信息原样返回，可作为客户端发起请求流水
**tokenid**为用户身份标识，用于标识当前请求发起的用户身份，登录用户获得的唯一标识
**data**为请求业务数据实体，此数据将由管理类直接交互给对应处理服务
**processkey** 事务key，默认单次请求为一次弱事物，若开启事物，需客户端手工结束事物，事物操作超时时间默认为300s，非必选
**encrypt** 加密及压缩标识，默认为明文不压缩，非必选
**debug** 调试标识，默认为非调试模式，非必选
注：为优化权限管理，修复业务访问权限bug，请求格式做适当调整，客户端无需传递模块对应的后端服务，将其定义到数据库模块数据上，以防权限注入，调试时可传入调用服务及方法。

## 客户端HTTP调用服务外层格式定义

HTTP字符流方式调用服务可分为实时请求及准实时请求。准实时请求为非高动态变更数据，在一定时间范围内请求与响应数据一致，如资源数据、档案数据、周期性数据等，准实时数据为平台对接集团CDN加速数据；实时数据为高动态数据，如位置上报等。服务平台接受客户端JSON格式的数据请求，经过相应处理转换为java原生对象传给后端服务及服务池。

**HTTP请求地址为：***http://service:port/services/version/modulename/operation?*

**请求格式定义：**

```
{
	“tag”: “12345”,
	“tokenid:” ““,
	[“processkey”: ““, ] 
	[“encrypt”: ““, ] 
	[“debug”: ““, ] 
	[“callback”: ““, ]
	“data”: {}
}
```

其中：
**modulename** 标识客户端调用模块名称
**operation** 标识客户端操作
**version** 模块版本，默认为最新版本，非必选
**tag**标识客户端处理响应标记，请求信息原样返回，可作为客户端发起请求流水
**tokenid**为用户身份标识，用于标识当前请求发起的用户身份，登录用户获得的唯一标识
**data**为请求业务数据实体，此数据将由管理类直接交互给对应处理服务
**processkey** 事务key，默认单次请求为一次弱事物，若开启事物，需客户端手工结束事物，事物操作超时时间默认为300s，非必选
**encrypt** 加密及压缩标识，默认为明文不压缩，非必选
**debug** 调试标识，默认为非调试模式，非必选
**callback** Jsonp支持，非必选
**注：***目前后端仅支持kv请求，key为parameter,value为上述json*

## 服务端响应调用返回外层格式定义
**返回格式定义：**

```
{
	[“services”: “action”, “exception”: ““,]
	“modulename”: “queryCar”, 
	“operation”: ““, 
	“tag”: “12345”,
	“status”: 1,
	“msg”: ““,
	[“processkey”: ““,] 
	[ “version”: ““,]
	“data”: {}
}
```
其中:
**services**标识该业务后端处理方法，
**modulename**标识前端调用模块
**operation** 标识后端操作
**tag**为前端发起请求或注册后端回调时的回调参数
**status**为后端处理状态,处理状态为success/warn/error。 success为成功标识；warn标识后端有一些警告信息，但并不影响整个流程处理，其中非关键异常信息存储在exception信息中；error标识后端处理发送关键异常，导致整个过程处理终端，其关键异常信息存储在exception中。
**注：***<=-120  关键异常   <=-110 权限不足  <=-101尚未登录  <=-1非关键异常  >0 成功*
**exception**为端产生的异常信息，此字段不作为关键参数存在
**processkey**为后端传输给前端的回调参数，在处理流程事务，以及连续操作时使用，此字段也非关键参数
**data**为后端处理服务响应数据

## 在线维持
用户登录后需维持在线状态，后端将清理无效在线用户，维持真实在线用户列表，防止僵尸用户：

```
{
	"modulename": "systime",
	"tag": "exttag",
	"operation": "systime",
	"data": {},
	"tokenid": "17f3f93a-4580-11e5-b785-fa163e6f7961"
}
```

后端服务实施更新每个用户最后请求时间，当最后通信时间超出阀值（默认为10分钟），后端将清理该用户连接等相关在线缓存信息，因此，如前端需要维持在线状态需定时发送在线维持请求，确保最后请求时间不超过超时阀值。 

```
{
	"operation": "systime",
	"modulename": "systime",
	"status": 1,
	"tag": "exttag",
	"data": {
		"systemTime": 1388112191
	},
	"tokenid": "17f3f93a-4580-11e5-b785-fa163e6f7961"
}
```
其中 ：
**status**为1表示响应成功
**systemTime**为当前服务平台系统时间UTC

## 系统登录
系统登录 调用login模块，其参数格式如： 

```
{
	“modulename”: “login”,
	“tag”: “exttag”,
	“operation”: “login”,
	“data”: {
		“type”: “login_type”,
		“userName”: “name”,
		“userPass”: “passwd”
	}
}
{
	"modulename": "login",
	"tag": "exttag",
	"operation": "login",
	"data": {
		"type": "local",
		“userName”: “name”,
		“userPass”: “passwd”
	}
}
```
其中 ：
**type** 登录方式，不同登录方式传递data内数据项不同
**userName**对应的值为登录用户名
**userPass**为登录密码


**返回格式定义：**

```
{
	“operation”: “login”,
	“modulename”: “login”,
	“status”: 1,
	“tag”: “exttag”,
	“data”: {
		“status”: 1,
		“userName”: “name”,
		“tokenid”: “17f3f93a-4580-11e5-b785-fa163e6f7961”,
		“msg”: “登录成功！”
	}
	“msg”: “登录成功！”
}
```
如上登录成功消息：
**status**为1表示登录成功，
**tokenid**为登录成功后生成的令牌，唯一标识当前登录客户端，所有后端数据访问均需附带此标识！

## 系统登出
系统登出 调用logout模块，其参数格式如： 

```
{
	"modulename": "logout",
	"tag": "exttag",
	"operation": " logout ",
	"data": {},
	"tokenid": " 17f3f93a-4580-11e5-b785-fa163e6f7961"
}
```
其中 ：
**tokenid**为登录成功后生成的令牌，唯一标识当前登录客户端

```
{
	“operation”: “logout”,
	“modulename”: “logout”,
	“status”: 1,
	“tag”: “exttag”,
	“data”: {
		“status”: 1,
		“msg”: “登出成功！”
	},
	“tokenid”: “17f3f93a-4580-11e5-b785-fa163e6f7961”,
	“msg”: “登出成功！”
}
```
如上登出成功消息：
**status**为1表示登出成功

## Tcp通道建立
C/S订阅消息由后端主动推送，需订阅前建立通信通道，建立通道连接格式如下：

### 文本格式

```
{
	“tokenid”: “7679138619ce484ea39d6a73b20b4024”,
	“modulename”: “message_module”,
	“operation”: “passageway”,
	“tag”: “getway1”,
	“data”: {}
}
```
其中：
**operation**标识为passageway建立订阅消息通道
**tag**为指定订阅通道号标识，需与上述订阅一致

### 二进制格式
消息ID：0x0100。
通道数据格式

起始字节|字段|数据类型|描述及要求 
---|---|---|--- 
0|目标标识|BYTE[36]|tokenid
36|通道标识|BYTE[n]|tag

例如：
`7E 01 00 00 00 2B 00 01 31 37 66 33 66 39 33 61 2D 34 35 38 30 2D 31 31 65 35 2D 62 37 38 35 2D 66 61 31 36 33 65 36 66 37 39 36 31 67 65 74 77 61 79 63 7E`
拆解如下：

`7E 
01 00 
00 
00 2A 
00 01 
31 37 66 33 66 39 33 61 2D 34 35 38 30 2D 31 31 65 35 2D 62 37 38 35 2D 66 61 31 36 33 65 36 66 37 39 36 31 
67 65 74 77 61 79 
63 
7E`

## 订阅/取消订阅消息
订阅/取消订阅消息指令格式如下：

```
{
	“tokenid”: “17f3f93a-4580-11e5-b785-fa163e6f7961”,
	“modulename”: “message_module”,
	“operation”: “consume”,
	“tag”: “consume1”,
	“data”: {
		“type”: “track”,
		“tag”: “getway1”,
		“target_id”: 1
	}
}
{
	“tokenid”: “17f3f93a-4580-11e5-b785-fa163e6f7961”,
	“modulename”: “message_module”,
	“operation”: “unconsume”,
	“tag”: “consume1”,
	“data”:{
		“type”: “track”,
		“tag”: “getway1”,
		“target_id”: 1
	}
}
```
其中：
**operation**标识为consume /unconsume,订阅/取消订阅消息
**type**订阅/取消订阅消息类型，不同登录方式传递data内数据项不同
**tag**标识为订阅通道号

B/S获取订阅消息指令格式如下：
 
```
{
	“tokenid”: “dc69c5513f2043febd37a3dddf70a5da”,
	“modulename”: “message_module”,
	“operation”: “query”,
	“tag”: “getway1”,
	“data”: {}
}
```
其中：
**operation**标识为query查询订阅消息
**tag**标识为获取指定订阅通道号的信息，需与上述订阅一致


[more](http://www.oiue.org)


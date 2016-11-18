OIUE是一套完全解耦的服务化平台
=======
Open Intelligent Unitive Efficient [开放 智能 统一 高效]
**低门槛、轻量化、标准化、架构解耦、模块化以及去框架化**
##项目交流吐槽

```
QQ群：10939695  作者：Every、马航军等
敬请参与 联系我们：team@oiue.org 
提议吐槽：https://issues.sonatype.org/browse/OSSRH-23545
```
[入门指导](../../#入门指导)

[现有服务通信协议约定](../../#现有服务通信协议约定)

[相关开源库](../../#相关开源库)

[相关服务](../../#相关开源库)

======
题外话：

`	不知道你有没有修改开源项目的经历，好比在一锅乱炖里去捞所有的白菜，很多时候，需要把一锅都翻遍才能找出所有的白菜叶，我们希望倡导一种方式，完全遵循解耦的架构，从根本去解决这种一锅乱炖的局面。`
	
`	OIUE 开源的目的是为了降低入门门槛，推进轻量化、标准化、架构解耦、模块化以及去框架化，框架立足将模块切分最小粒度，确保每个模块均可单独替换、并最小限度模块依赖，开发者无需培训即可快速入手，亦不用关心底层架构、分布式服务调用及服务治理等相关繁琐复杂的实现。1.0版本框架采用了OSGI的底层容器，部分遵循OSGI标准，但模块Activator请严格遵循本项目，后续将推出多个版本的启动容器，以满足不同场景下业务需求，同时也欢迎有兴趣的朋友共同加入与探讨。`
	
`	作为程序开发人员，每天都在重复同样的工作，浪费了大量时间，严重影响了开发热情，简单而又重复的工作占用了我们太多的时间。程序语言由低级逐渐走向高级，出现了许多控件及框架，Java中spring等是很不错的框架，其应用广泛程度难有出其右者，但极其庞大的体系结构让人望而却步，笨重而又耦合的模块体系是在让人无法恭维，强制的调用及结构已经改变了语言原本的色彩，其本质并未从根本上解决程序开发中大量的重复工作，我们希望有一个工具或者一套设计，能够按照我们所习惯的操作模式，最大程度的复用、更高程度的解耦，延续一些开发偏好，以及更大的灵活性，不约定俗成的满足我们的开发需求，开放、智能、统一、高效，本软件框架构想由此应运而生。`
	
`	许多人会好奇为什么选择OSGI作运行容器，“OSGI架构师的天堂”这句话并不足以概括初衷，最重要的是，OSGI优秀的模块化结构，要求我们更加严谨，同时也让我们更加重视对封装、模块化的理解，模块应该尽可能减少对外界的依赖除非逼不得已，我见过太多原本应该最小实现却引用一大堆附加无用的功能的工具包，这里不一一列举，无力吐槽、仁者见仁智者见智吧，筑建一个开放、严谨、高效的开发群体，是本架构的初衷之一。`
		
	
`	从未见过哪个男人跟女生吵架能吵赢的，不是气急败坏地动起了手，就是沉默以对。这仅仅是男人的问题吗？达尔文说：“以前也有吵赢的，后来他们都找不到女朋友，于是灭绝了。”
	我们不希望出现类似与上面的故事，从前有一群很刻苦的人，由于没有时间恋爱，后来灭绝了！`

#入门指导


下载OIUE主工程，
https://github.com/OIUE/OIUE
http://git.oschina.net/every.oschina.net/OIUE

工程结构如下：

```
├── LICENSE
├── README.md
├── conf
│   ├── config.properties
│   └── org
│       ├── apache
│       │   └── felix
│       │       └── webconsole
│       │           └── internal
│       │               └── servlet
│       │                   └── OsgiManager.config
│       └── oiue
│           └── service
│               ├── action
│               │   ├── filter
│               │   │   └── auth
│               │   │       └── Activator.config
│               │   ├── http
│               │   │   ├── action
│               │   │   │   └── Activator.config
│               │   │   ├── managed
│               │   │   ├── services
│               │   │   │   └── Activator.config
│               │   │   └── upload
│               │   │       └── Activator.config
│               │   └── tcp
│               │       ├── action
│               │       │   └── Activator.config
│               │       └── bytes
│               │           └── Activator.config
│               ├── auth
│               │   └── local
│               │       └── Activator.config
│               ├── buffer
│               │   └── synchronization
│               │       └── db
│               │           └── Activator.config
│               ├── cache
│               │   ├── impl
│               │   │   └── Activator.config
│               │   ├── jedis
│               │   │   └── Activator.config
│               │   └── tree
│               │       └── zookeeper
│               │           └── curator
│               │               └── Activator.config
│               ├── debug
│               │   ├── cache
│               │   │   └── Activator.config
│               │   └── treecache
│               │       └── Activator.config
│               ├── driver
│               │   └── listener
│               │       └── storage
│               │           └── Activator.config
│               ├── log4j
│               │   └── Activator.config
│               ├── message
│               │   └── impl
│               │       └── Activator.config
│               ├── odp
│               │   └── res
│               │       └── base
│               │           └── Activator.config
│               ├── online
│               │   └── impl
│               │       └── Activator.config
│               ├── osgi
│               │   └── rpc
│               │       └── Activator.config
│               ├── permission
│               │   ├── impl
│               │   │   └── Activator.config
│               │   └── verify
│               │       └── Activator.config
│               ├── sql
│               │   └── apache
│               │       └── Activator.config
│               ├── system
│               │   └── analyzer
│               │       └── impl
│               │           └── Activator.config
│               └── template
│                   └── beetl
│                       └── Activator.config
├── oiue.sh
└── pom.xml
```
其中 
conf是各服务的配置文件

执行`mvn install`
修改oiue.sh中jre及工程的目录
修改conf\org\oiue\service\sql\apache\Activator.config 连接自己的数据库
执行`./oiue.sh start`启动服务


`开源库中提供了部分开放服务，可快捷搭建自己的各类应用服务。`

**创建自己的服务**[以实现登录认证为例]
创建Meavn项目，

```
├── pom.xml
└── src
    └── main
        └── java
            └── org
                └── oiue
                    └── service
                        └── auth
                            └── local
                                ├── Activator.java
                                └── AuthLocalServiceImpl.java
```
登录认证依赖于日志服务（父工程已经引用）、认证服务、数据查询服务，配置如下：

```
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<artifactId>org.oiue.service.auth.local</artifactId>
	<packaging>bundle</packaging>

	<name>OIUE service for auth impl by local </name>
	<description>A bundle that Auth service by local </description>
	<parent>
		<groupId>org.oiue.services</groupId>
		<artifactId>services</artifactId>
		<version>1.0.0</version>
	</parent>

	<dependencies>
		<dependency>
			<groupId>org.oiue.services</groupId>
			<artifactId>org.oiue.service.auth</artifactId>
			<version>1.0.0</version>
		</dependency>
		<dependency>
			<groupId>org.oiue.services.odps</groupId>
			<artifactId>org.oiue.service.odp.res.api</artifactId>
			<version>1.0.0</version>
		</dependency>
	</dependencies>
	<properties>
		<project.activator>${artifactId}.Activator</project.activator>
	</properties>
</project>
```
服务初始化时传入依赖的服务，从配置中读取事件ID，以及客户端传递过来的用户名密码结构路径、此认证服务的名称。
如客户端用户认证信息如下：

```
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

服务的配置文件在主工程的conf目录下，
配置文件如下：

```
service.pid="org.oiue.service.auth.local.Activator"
login.local.auth.eventId="fm_system_service_auth_user"
login.sso.type="local"
login.local.key.name="userName"
login.local.key.pass="userPass"
```
则服务代码实现如下：

```
package org.oiue.service.auth.local;

import java.io.Serializable;
import java.util.Dictionary;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import org.oiue.service.auth.AuthService;
import org.oiue.service.auth.AuthServiceManager;
import org.oiue.service.log.LogService;
import org.oiue.service.log.Logger;
import org.oiue.service.odp.base.FactoryService;
import org.oiue.service.odp.res.api.IResource;
import org.oiue.service.online.Online;
import org.oiue.service.online.OnlineImpl;
import org.oiue.service.online.Type;
import org.oiue.tools.string.StringUtil;

@SuppressWarnings({ "unchecked", "rawtypes" })
public class AuthLocalServiceImpl implements AuthService, Serializable {
    private static final long serialVersionUID = -3485450639722467031L;
    private Logger logger;
    private String event_id;
    private FactoryService factoryService;
    private AuthServiceManager authServiceManager;
    private String type = "local";
    private String name = "userName";
    private String pass = "userPass";

    public AuthLocalServiceImpl(LogService logService, FactoryService iresource, AuthServiceManager authServiceManager) {
        logger = logService.getLogger(this.getClass().getName());
        this.factoryService = iresource;
        this.authServiceManager = authServiceManager;
    }

    public void updated(Dictionary dict) {
        try {
            event_id = (String) dict.get("login.local.auth.eventId");
            name = (String) dict.get("login.local.key.name");
            pass = (String) dict.get("login.local.key.pass");
            String type = (String) dict.get("login.sso.type");
            if (!StringUtil.isEmptys(type) && !type.equals(this.type)) {
                authServiceManager.unRegisterAuthService(this.type);
                this.type = type;
            }
            authServiceManager.registerAuthService(type, this);
        } catch (Throwable e) {
            logger.error("config is error :" + dict, e);
        }
    }

    @Override
    public void unregister() {
        authServiceManager.unRegisterAuthService(type);
    }

    @Override
    public Online login(Map per) {
        String username = (String) per.remove(name);
        String password = (String) per.remove(pass);
        String tokenId = null;
        Online online = new OnlineImpl();
        if (!StringUtil.isEmptys(username) && !StringUtil.isEmptys(password)) {
            Map<String, Object> map = new HashMap<>();
            map.put("origin_name", type);
            map.put("user_name", username);
            map.put("password", password);
            try {
                IResource iResource = factoryService.getBmo(IResource.class.getName());
                map = (Map<String, Object>) iResource.callEvent(event_id, null, map);
                if (map == null || map.size() == 0) {
                    throw new RuntimeException("login error,username or password is error!");
                }
            } catch (Throwable e) {
                throw new RuntimeException(e);
            }
            tokenId = UUID.randomUUID().toString().replaceAll("-", "");
            online.setO(new ConcurrentHashMap<>());
            online.setToken(tokenId);
            online.setType(Type.http);
            online.setUser(map);
            online.setUser_id(map.get("user_id") + "");
            online.setUser_name(map.get("user_name") + "");
        }
        return online;
    }

    @Override
    public boolean logout(Map per) {
        return false;
    }

}
```

**服务注册Activator如下：**

```
package org.oiue.service.auth.local;

import java.util.Dictionary;

import org.oiue.service.auth.AuthService;
import org.oiue.service.auth.AuthServiceManager;
import org.oiue.service.log.LogService;
import org.oiue.service.odp.base.FactoryService;
import org.oiue.service.odp.res.api.IResource;
import org.oiue.service.osgi.FrameActivator;
import org.oiue.service.osgi.MulitServiceTrackerCustomizer;

public class Activator extends FrameActivator {

    @Override
    public void start() throws Exception {
        this.start(new MulitServiceTrackerCustomizer() {
            AuthLocalServiceImpl authService;

            @Override
            public void removedService() {
            	authService.unregister();
            }

            @SuppressWarnings("unused")
            @Override
            public void addingService() {
                LogService logService = getService(LogService.class);
                FactoryService factoryService = getService(FactoryService.class);
                AuthServiceManager authServiceManager = getService(AuthServiceManager.class);
                IResource iResource = getService(IResource.class);

                authService = new AuthLocalServiceImpl(logService, factoryService, authServiceManager);

                registerService(AuthService.class, authService);
            }

            @Override
            public void updated(Dictionary<String, ?> props) {
                authService.updated(props);
            }
        }, LogService.class, AuthServiceManager.class, FactoryService.class,IResource.class);
    }

    @Override
    public void stop() throws Exception {}
}
```
 `public final void start(MulitServiceTrackerCustomizer mstc, Class... cs)`中cs为依赖的服务，通过getService获取服务实例。
 
OIUE1.0采用Mysql作为主数据库，数据库操作相关服务均以此为基础，数据库设计如下：
![DB](OIUE_DB.png)

#现有服务通信协议约定
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


#相关开源库

**开源库及服务说明如下：**

开源库名称|描述
---|---
OIUE主工程（服务启动容器felix）|https://github.com/OIUE/OIUE
OIUE基于OSGI打包配置|https://github.com/OIUE/OIUE-CONFIGURATOR
OIUE核心服务（容器隔离及核心服务定义）|https://github.com/OIUE/OIUE-CORE
OIUE核心服务实现|https://github.com/OIUE/OIUE-BASE
OIUE基于jdbc事物封装|https://github.com/OIUE/OIUE-ODPS
OIUE开放服务|https://github.com/OIUE/OIUE-SERVICES

以下服务均可在maven中央库及 https://mvnrepository.com 找到

#相关服务

服务名称|纯接口|bundle
---|---|---
工具包|N|org.oiue.tools-1.0.0.jar
启动容器隔离封装服务（基于OSGI）|N|org.oiue.service.osgi.rpc-1.0.0.jar
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

[more](http://www.oiue.org)


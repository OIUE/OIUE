OIUE
=======

Open Intelligent Unitive Efficient
开放 智能 统一 高效
题外话：
不知道你有没有修改开源项目的经历，好比在一锅乱炖里去捞所有的白菜，很多时候，需要把一锅都翻遍才能找出所有的白菜叶，我们希望倡导一种方式，完全遵循解耦的架构，从根本去解决这种一锅乱炖的局面。
OIUE 开源的目的是推进轻量化、标准化、架构解耦、模块化以及去框架化，框架立足将模块切分最小粒度，确保每个模块均可单独替换、并最小限度模块依赖，开发者无需培训即可快速入手，亦不用关心底层架构、分布式服务调用及服务治理等相关繁琐复杂的实现。1.0版本框架采用了OSGI的底层容器，部分遵循OSGI标准，但模块Activator请严格遵循本项目，后续将推出多个版本的启动容器，以满足不同场景下业务需求，同时也欢迎有兴趣的朋友共同加入与探讨。
作为程序开发人员，每天都在重复同样的工作，浪费了大量时间，严重影响了开发热情，简单而又重复的工作占用了我们太多的时间。程序语言由低级逐渐走向高级，出现了许多控件及框架，Java中spring等是很不错的框架，其应用广泛程度难有出其右者，但极其庞大的体系结构让人望而却步，笨重而又耦合的模块体系是在让人无法恭维，强制的调用及结构已经改变了语言原本的色彩，其本质并未从根本上解决程序开发中大量的重复工作，我们希望有一个工具或者一套设计，能够按照我们所习惯的操作模式，最大程度的复用、更高程度的解耦，延续一些开发偏好，以及更大的灵活性，不约定俗成的满足我们的开发需求，开放、智能、统一、高效，本软件框架构想由此应运而生。
许多人会好奇为什么选择OSGI作运行容器，“OSGI架构师的天堂”这句话并不足以概括初衷，最重要的是，OSGI优秀的模块化结构，要求我们更加严谨，同时也让我们更加重视对封装、模块化的理解，模块应该尽可能减少对外界的依赖除非逼不得已，我见过太多原本应该最小实现却引用一大堆附加无用的功能的工具包，这里不一一列举，无力吐槽、仁者见仁智者见智吧，筑建一个开放、严谨、高效的开发群体，是本架构的初衷之一。
1024 程序员节 OIUE盛大发布 我们不见不散
从未见过哪个男人跟女生吵架能吵赢的，不是气急败坏地动起了手，就是沉默以对。这仅仅是男人的问题吗？达尔文说：“以前也有吵赢的，后来他们都找不到女朋友，于是灭绝了。”
我们不希望出现类似与上面的故事，从前有一群很刻苦的人，由于没有时间恋爱，后来灭绝了！
一个典型的Activator
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

more
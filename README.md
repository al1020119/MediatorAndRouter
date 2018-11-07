# MediatorAndRouter
App架构之组件化策略，MGJRouter(URLRouter) 和 CTMediator(Target-Action)，实战与项目介入，相关细节实现

## 强烈推荐：

##### iOS组件化方案对比 https://blog.csdn.net/mlcldh/article/details/82887997?from=timeline&isappinstalled=0

##### 蘑菇街 App 的组件化之路 https://limboy.me/tech/2016/03/14/mgj-components-continued.html

##### iOS应用架构谈 组件化方案  https://casatwy.com/iOS-Modulization.html


## 组件化/模块化


### 1. 博客文章:


  + [[模块化与解耦](模块化与解耦 - 刘坤的技术博客)](https://blog.cnbluebox.com/blog/2015/11/28/module-and-decoupling/)


  + [[浅析 iOS 应用组件化设计](Skyline75489)](https://skyline75489.github.io/post/2016-3-16_ios_module_design.html)


  + [[iOS组件化思路-大神博客研读和思考](iOS组件化思路－大神博客研读和思考 - 简书)](https://www.jianshu.com/p/afb9b52143d4)


  + [[iOS组件化实践方案-LDBusMediator练就](iOS组件化实践方案－LDBusMediator炼就 - 简书)](https://www.jianshu.com/p/196f66d31543)


  + [[iOS组件化方案探索](iOS 组件化方案探索 « bang’s blog)](http://blog.cnbang.net/tech/3080/)


  + [[IOS-组件化架构漫谈](组件化架构漫谈 - 简书)](https://www.jianshu.com/p/67a6004f6930)


  + [[一个iOS模块化开发解决方案](一个iOS模块化开发解决方案 - CocoaChina_让移动开发更简单)](http://www.cocoachina.com/ios/20161103/17932.html)


### 2. 知名APP组件化方案


  + [[豆瓣App的模块化实践](豆瓣App的模块化实践 - CocoaChina_让移动开发更简单)](http://www.cocoachina.com/ios/20161103/17938.html)


  + [[手机天猫解耦之路](手机天猫解耦之路)](http://www.infoq.com/cn/articles/the-road-of-mobile-tmall-decoupling)


  + [[京东iOS客户端组件管理实践](京东iOS客户端组件管理实践)](http://www.infoq.com/cn/articles/jd-ios-component-management)


  + [[滴滴出行iOS客户端架构演进之路](滴滴出行)](https://mp.weixin.qq.com/s?__biz=MzUxMzcxMzE5Ng==&mid=2247488503&amp;idx=1&amp;sn=2c9a82593ebb06533f484f77035c4550&source=41#wechat_redirect)


  + [[蘑菇街 App 的组件化之路](蘑菇街APP组件化1) 推荐,讲的比较全面](https://limboy.me/tech/2016/03/10/mgj-components.html)


  + [[蘑菇街 App 的组件化之路·续](蘑菇街APP组件化2) 推荐,讲的比较全面](https://limboy.me/tech/2016/03/14/mgj-components-continued.html)


  + [[手机淘宝客户端架构探索实践](手机淘宝客户端架构探索实践-博客-云栖社区-阿里云 )](https://yq.aliyun.com/articles/129)


  + [[支付宝钱包客户端技术架构](支付宝钱包客户端技术架构-博客-云栖社区-阿里云 )](https://yq.aliyun.com/articles/128?spm=a2c4e.11153940.blogcont129.7.25f513ddyqFUKb)


### 3. 组件化实践


  + [[iOS组件化实践](组件化实践)](http://www.cocoachina.com/ios/20171120/21234.html)


  + [[谈谈我的理解-组件化/模块化](组件化/模块化)](https://www.jianshu.com/p/79e4df63f31f)


  + [[iOS组件化实践(一)：简介](iOS组件化实践(一)：简介 - 简书)](https://www.jianshu.com/p/568e875abd48)


  + [[iOS组件化实践(二)：准备](iOS组件化实践(二)：准备 - 简书)](https://www.jianshu.com/p/824d4227e123)


  + [[iOS组件化实践(一)：简介](iOS组件化实践(一)：简介 - 简书)](https://www.jianshu.com/p/568e875abd48)


### 4. 最后推荐几篇好的架构文章


  + [[iOS应用架构谈 开篇](iOS应用架构谈 开篇 - Casa Taloyum)](https://casatwy.com/iosying-yong-jia-gou-tan-kai-pian.html)


  + [[iOS应用架构谈 view层的组织和调用方案](iOS应用架构谈 view层的组织和调用方案 - Casa Taloyum)](https://casatwy.com/iosying-yong-jia-gou-tan-viewceng-de-zu-zhi-he-diao-yong-fang-an.html)


  + [[iOS应用架构谈 网络层设计方案](iOS应用架构谈 网络层设计方案 - Casa Taloyum)](https://casatwy.com/iosying-yong-jia-gou-tan-wang-luo-ceng-she-ji-fang-an.html)


  + [[iOS应用架构谈 本地持久化方案及动态部署](iOS应用架构谈 本地持久化方案及动态部署 - Casa Taloyum)](https://casatwy.com/iosying-yong-jia-gou-tan-ben-di-chi-jiu-hua-fang-an-ji-dong-tai-bu-shu.html)


  + [[iOS应用架构谈 组件化方案](组件化方案)](https://casatwy.com/iOS-Modulization.html)

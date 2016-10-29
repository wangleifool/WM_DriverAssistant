# WM_DriverAssistant
仿驾考宝典，学习加练习。

需求分析：
模仿驾考宝典，开发一款从报名到买车一体化的ios app。 主要目的不是业务，而是技术练习。故UI设计暂时完全参考驾考宝典。（有很有意思的模块可以加入）
业务多的功能只需要做个测试版本即可。


app的UI主框架：
tab bar Controller （tab 报名 ，tab 驾考，tab 发现，tab 买车，tab 百宝箱）
各tab的主视图控制器以navigationController为根视图

各tab的主视图的UI元素：

可复用的UI模块： 
{
 支持右滑弹出左侧设置视图功能的Navigation Bar。
细节需开发时再确定。
}

{

}

代码设计模式： MVC

分工：


     

搭建app的基础框架						分配WL
page 驾考						 	分配WL	
page 百宝箱							分配MY
page 发现						 	分配WL
page 报名							分配MY
page 买车 和所在的导航栏  					分配WL
导航栏弹出左侧视图             					分配MY

基础版本
1.添加tabbarController。
2.添加了导航视图控制器基类。一个来定制支持左边滑动视图的导航栏；另一个定制买车页面，导航栏的标题视图是几个按钮组成的。
3.添加了五个视图类，各自继承对应的导航视图控制器基类。
4.添加了一些资源。
5.添加了一些全局宏定义和工具类，全局头文件生命与pch文件中。

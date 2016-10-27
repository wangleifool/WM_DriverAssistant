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


     
功能模块 							描述  																																						难度  分配  		说明
搭建app的基础框架			TabbarController + 每个tab的主视图控制器 + 每个tab的主视图控制器的导航栏控制器+上次github	1级	 W   		tabbarController 用代码创建 使用plist来记录
tab 驾考																																															  3级  W	
tab 百宝箱																																															 1级  M
tab 发现																																																0级	W
tab 报名																																																2级	M
tab 买车																																																2级  W
导航栏弹出左侧视图																																												 2级  M



//
//  Defines.h
//  NewsReader
//
//  Created by hejinbo on 15/7/7.
//  Copyright (c) 2015年 MyCos. All rights reserved.
//


#if (DEBUG || TESTCASE)
#define FxLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define FxLog(format, ...)
#endif

// 日志输出宏
#define BASE_LOG(cls,sel) FxLog(@"%@-%@",NSStringFromClass(cls), NSStringFromSelector(sel))
#define BASE_ERROR_LOG(cls,sel,error) FxLog(@"ERROR:%@-%@-%@",NSStringFromClass(cls), NSStringFromSelector(sel), error)
#define BASE_INFO_LOG(cls,sel,info) FxLog(@"INFO:%@-%@-%@",NSStringFromClass(cls), NSStringFromSelector(sel), info)

// 日志输出函数
#if (DEBUG || TESTCASE)
#define BASE_LOG_FUN()         BASE_LOG([self class], _cmd)
#define BASE_ERROR_FUN(error)  BASE_ERROR_LOG([self class],_cmd,error)
#define BASE_INFO_FUN(info)    BASE_INFO_LOG([self class],_cmd,info)
#else
#define BASE_LOG_FUN()
#define BASE_ERROR_FUN(error)
#define BASE_INFO_FUN(info)
#endif

// 设备类型判断
#define IsiPad     (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IsiPhone   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IsRetain   ([[UIScreen mainScreen] scale] >= 2.0)
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define ScreenMaxLength (MAX(ScreenWidth, ScreenHeight))
#define ScreenMinLength (MIN(ScreenWidth, ScreenHeight))

#define IsiPhone4   (IsiPhone && ScreenMaxLength < 568.0)
#define IsiPhone5   (IsiPhone && ScreenMaxLength == 568.0)
#define IsiPhone6   (IsiPhone && ScreenMaxLength == 667.0)
#define IsiPhone6P  (IsiPhone && ScreenMaxLength == 736.0)


// 消息通知
#define RegisterNotify(_name, _selector)                    \
    [[NSNotificationCenter defaultCenter] addObserver:self  \
    selector:_selector name:_name object:nil];  

#define RemoveNofify            \
    [[NSNotificationCenter defaultCenter] removeObserver:self];

#define SendNotify(_name, _object)  \
    [[NSNotificationCenter defaultCenter] postNotificationName:_name object:_object];

// 设置颜色值
#define RgbColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

// 统计
#define StatisSetUp()           [FxStatis setup];
#define StatisIntoPage(page)    [FxStatis intoPage:page]
#define StatisOutPage(page)     [FxStatis outPage:page]
#define StatisEvent(_e, _v)     [FxStatis event:_e value:_v]
#define GetPageName()           NSStringFromClass([self class])


/*网络相关
 {result:ok, data:data}
 {result:error,message:""}
 {result:invalidatetoken, message:"token失效"}
 */
#define NetResult           @"result"
#define NetOk               @"ok"
#define NetData             @"data"
#define NetMessage          @"message"
#define NetInvalidateToken  @"invalidetoken"
#define HTTPSchema          @"http:"
#define HTTPGET             @"GET"
#define HTTPPOST            @"POST"
#define FxRequestTimeout    10

// 文件缓存路径
#define RootPath            @"/Library/.DriverAssistant"
#define CacheImagePath      @"CacheImages"
#define NewsIconPrex        @"NewsIcon_%@"
#define NewsDBFile          @"DriverAssistant.db"

//广告常量
#define AdvertKey           @"AdvertKey"
#define AdvertCheckTime     60*60
#define AdvertDelayTime     3

// iOS系统版本
#define IOSBaseVersion8     8.0
#define IOSBaseVersion7     7.0
#define IOSBaseVersion6     6.0

// 其他常量
#define AnimationSecond     1.0
#define NavBarHeight        44
#define NavBarHeight7       64
#define TabBarHeight        49
#define LocationDistance    100

// 消息通知Key
#define NofifyNewsIcon      @"NewsIcon"

// 微信
#define WXAppID             @"wx76ffeeea1020dfc1"

// 小米推送key
#define MiPushRegister      @"registerMiPush:"
#define MiPushSetAlias      @"setAlias:"
#define MiPushSetTopic      @"subscribe:"

// 渠道
#define ChannelAppStore     @"AppStore"
#define ChannelEnterprise   @"Enterprise"

// HTML标记
#define HtmlBody            @"{{body}}"
#define HtmlTitle           @"{{title}}"
#define HtmlSource          @"{{source}}"
#define HtmlPTime           @"{{ptime}}"
#define HtmlDigest          @"{{digest}}"
#define HtmlSourceURL       @"{{source_url}}"
#define HtmlImage           @"<p><img src='%@' style='margin:auto 0; width:100%%;' />"

// 提示信息
#define LoginingTip         @"登录中..."
#define LoadingTip          @"加载中..."
#define LoginCheckTip       @"用户名或密码不能为空"
#define LoginTitle          @"登录驾考宝典"
#define WeatherSuffix       @"市市辖区"
#define kScreenWidth        ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight       ([UIScreen mainScreen].bounds.size.height)


//web url
//前面写服务器给的域名，后面拼接上需要提交的参数，假如参数是key=1
#define JiaKaoPageTwoDataUrl @"https://sirius.kakamobi.cn/api/open/exam-project/list.htm?_a=2wy9wAxvVAwy7Vz404V635zVw5z3z6790322&_appName=jiakaobaodianxingui&_appUser=03fbeaeb4f65146bf6cea851f45841ca&_cityCode=510100&_cityName=%E6%88%90%E9%83%BD%E5%B8%82&_device=KOBE%20use%20iPad&_firstTime=2017-03-31%2008%3A49%3A30&_gpsCity=510100&_gpsType=baidu&_html5=false&_imei=549af8c6669249e19516b3303d5cdd284ec672ca&_j=1.0&_jail=false&_latitude=30.67943289807245&_launch=5&_longitude=103.797371602262&_mac=549af8c6669249e19516b3303d5cdd284ec672ca&_manufacturer=Apple&_network=wifi&_operator=N&_pkgName=cn.mucang.ios.jiakaobaodianPromise&_platform=iphone&_product=%E9%A9%BE%E8%80%83%E5%AE%9D%E5%85%B8%E6%96%B0%E8%A7%84&_productCategory=jiakaobaodian&_r=a64a03026aaff90f16f3e227ecaa1b34&_renyuan=mucang&_screenDip=1&_screenHeight=1024&_screenWidth=768&_system=iPhone%20OS&_systemVersion=9.3.5&_u=w9x69536V0A0xVz483V4w3zV94x7x9v62234&_userCity=510100&_vendor=appstore&_version=6.6.10&_webviewVersion=4.7&cursor=0&kemu=2&pageSize=100&schoolCode=510100030&schoolName=%E6%88%90%E9%91%AB%E9%A9%BE%E6%A0%A1&tiku=car&sign=941ac9e184b0701830316848fe33e7c3"


#define AdvertisementImageUrl @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1502103934931&di=e040e9d93d8299e9bdcd708bcd2c0145&imgtype=0&src=http%3A%2F%2Fimg.r1.market.hiapk.com%2Fdata%2Fupload%2F2013%2F12_10%2F10%2F201312101018580493.jpg"

//database row name
#define tableAllQuestion @"leaflevel"
#define rowID   @"mid"
#define rowQuestion @"mquestion"
#define rowDesc     @"mdesc"
#define rowAnswer   @"manswer"
#define rowImage    @"mimage"
#define rowSectionID @"pid"
#define rowSectionName @"pname"
#define rowType        @"mtype"

#define IsChoiceQuestion 1
#define IsTrueOrFalseQuestion 2

//标签页参数
#define UNSELECTED_COLOR   [UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0] //gray
#define SELECTED_COLOR     [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1.0]     //black
#define BACKGROUND_COLOR   [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0]
#define GroupTableViewBackgroundColor [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0]
//#define NavigationBarColor [UIColor colorWithRed:32/255.0 green:198/255.0 blue:219/255.0 alpha:1.0]

// page question practice
#define HEIGHT_OF_PRACTICE_TOP_TOOLBAR 48
#define HEIGHT_OF_PRACTICE_BOTTOM_TOOLBAR 256

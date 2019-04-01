# ChartsSimpleDemo

基于Charts库的一个最简单的Demo。<br>  
Charts库给的Demo比较全，我只整理了一个比较常用的，以最精简方式使用。<br>  
假如了CocoaPods框架，用了OC与Swift混合编译。<br>  
假如您的项目也需要相同的功能，可以直接拿去用。<br>  

<img src="https://github.com/laofa2012/ChartsSimpleDemo/blob/master/ReadMeResource/charts_simple_demo_guide.png" width="375" alt="截图" />

## 此例子针对OC调用Charts库做的例子：

1. Charts库使用Swift开发，必须要使用mix来做oc的开发；
2. Pod导入Charts库，pod install进行安装；
3. 混编oc与swift，需要建立桥接文件；
4. 比较简单的方法就是，创建一个swift文件，系统询问是否添加'product_name-Bridging-Header.h'，同意创建
5. 接着系统会帮你创建一个默认文件，不能编辑：'product_name-Swift.h'，oc调用swift需要导入此文件
6. 注意，这里有两个问题需要重视：
    * 假如导入后系统提示找不到文件，在'Build Settings'输入'-swift'寻找真正文件名，空格与横杠系统会帮你替换为下划线；
    * 必须保证`**项目中有swift文件**`，pod框架中的不算在内，否则找不到该文件；
7. 假如swift文件需要用oc内容，只需要在'product_name-Bridging-Header.h'导入就行了；
8. 以此项目为例，#import "ChartsDemo-Swift.h"，还不能使用pod框架中的库，必须@import Charts，此项目我写在了'DateValueFormatter.h'中了；


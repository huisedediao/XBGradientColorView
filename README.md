# XBGradientColorView
渐变色view<br/>
###效果：<br/>
![image](https://github.com/huisedediao/XBGradientColorView/raw/master/showNew.png)<br/>


###示例代码：
<pre>
    XBGradientColorView *grv=[XBGradientColorView new];
    [self.view addSubview:grv];
    grv.frame=CGRectMake(0, 20, 375, 500);
    grv.fromColor=[UIColor colorWithHex:@"#2099f4"];
    grv.toColor=[UIColor colorWithHex:@"#215eeb"];
    grv.direction=0;//设置渐变方向
</pre>

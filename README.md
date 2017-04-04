# MVVM

>写在文章之前，这是我第一次用MVVM来写小Demo。工作一年多才敢写MVVM，一来：从初次使用RAC到认识RAC就花了不少时间，二来：一直在思考如何去写MVVM。现在感觉时候到了，于是就写了这么一个Demo。我认为学习编程最直接的就是去仿写个什么东西，这样你就会发现很多问题，成长的才会更快。当然感觉现在写的也会有很多问题，希望大家指点，发出来的目的也是希望更多人看到，能给更多的建议。

MVVM这个东西，看似神秘，其实本质与MVC没什么差别(这句话说的装逼了些)。

>首先要说明一下，用MVVM前，最好先了解一下RAC，查了很多资料，发现这两个基本是不分家的。其次就是，如果你合理使用RAC，即使你用的是MVC，也会减轻C很大的压力。所以RAC是个好东西，可惜我还不是很精通(这句话就很舒服了)。

分享我知道的一个不错的视频:虽然时间比较早，但是都是精髓。
https://pan.baidu.com/s/1hr8omLA
我是通过这个视频了解的RAC，但是我开始了解RAC的时候却是半年之后。所以大家不要着急，慢慢摸索。

话不多说，进入正题，这里我们来模仿JD详情页来做一下。

先来看一下界面

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-981e5388df3ca0e2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

---
![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-7c954a353b7aecf1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


当看到这两个界面的时候，我有点方了，好像没什么规律的样子。

虽然我陆续看了好几个界面，突然意识到一件事，这大概跟数据有关，让我们来看一下数据，这里我们可以使用Charles青花瓷来抓取一下。

####开始我们真正的第一步，数据抓取

推荐Charles文章：http://blog.devtang.com/2015/11/14/charles-introduction/
![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-d3d265fda674b4bf.png)

>这里简单说一下，在你连接上后可能会发现有很多的数据上有一把小锁，这是在提醒你，你需要一个叫做SSL的证书，安装完成后，点击右键，然后点击一下Enbale SSL Proxying，然后重新抓取一下试试，像上图一样。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-b04415eb2e6905df.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这里面就是我们需要的数据。

>不好意思写文章喜欢听歌，左下角是歌词，大家见谅。

这两个文件就是我们需要的。

如果只看第一个请求，你会发现标题山下英子并找不到，所以还需要下面的规格详情的请求。而且下面的这个请求里还包含了店铺信息，还有轮播图的信息。

OK，数据有了，由于考虑到种种问题，我没有使用网络请求，所以我将数据都保存成了.json的文件，后续使用延时来模仿一下网络请求。

于是就有了这几个文件。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-e7e75982603eecf1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这几个json在我们刚才抓的里面都有，大家可以找找看看。什么？你问我怎么知道的，我也不知道 ，我也是一个一个试的。

####第二步，UI分析

有了数据，接下来分析一下界面。
首先有几个是肯定有的
- 轮播
- 商品简介
- 价格
- 已选
- 地址
- 最下面的小标签

我截了一张相对比较全的一张图

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-ee71c4d79c800188.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

也就是说
- 折扣
- 优惠券
- 促销
- 作者 
- 出版社
- 电子版

这些都是根据数据来的

####第三步界面搭建

OK，接下来就是比较复杂的搭建view。这里我就不一一介绍了，大家可以去github上去看一下我的。

先来分析一下Views的目录

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-889051361978fd58.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

说一下两个让我纠结很长时间的地方。

1.一个是促销，让我纠结很久，如果使用tableview有些过于复杂，使用其他方式又如何实现自适应呢？
于是我使用的是Masonry的特性，根据数据使用for循环来创建多个label，然后更新self的Masonry，设置lastview的mas_bottom距离self为-15就像这样。
![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-2f2d7770c0d3362f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.就是最后那些小标签怎么显示，使用collectionView？感觉也过于麻烦了，最后发现可以通过NSAttributedString来实现。

这样问题貌似就都解决了。

####第四步就是数据解析了

我们先来创建Model，Model我推荐大家使用ESJSONFormat这个第三方插件。可以快速创建Models，方便的大家使用。本来像个大家截图，但是发现截图貌似有问题，那我就直接发一下目录截图吧。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-95e626f5fed09cc3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

每个类里面都是ESJSONFormat生成的样式，没有做很多的修改，只是每个类的.m中加了setValue forUndefinedKey这个方法，用来防止发过来的数据键值对不全。

View也有了Model也有了，其实大家会发现，在MVVM中View与Model基本是没有变化的，重点在于新添加的ViewModel与Controller之间的改变。

####第五步，让我们看看我们可爱的ViewModel
首先，要明确的是ViewModel是将Controller中的数据处理抽取出来，以简化Controller的复杂度，于是我的理解是，从请求开始就要在ViewModel中了，于是我们需要模拟一下网络请求。
![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-ee321ca762d22710.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
-(RACSignal *)setupModel{
	    @weakify(self);
		return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
			@strongify(self);
			[[RACSignal combineLatest:@[[self setupDescModel], [self setupAuthorModel], [self setupCommentModel], [self setupCouponModel], [self setupRecommendModel]]] subscribeNext:^(id x) {
									            
				[self rebackDescModel];
				[self rebackCommentModel];
				[self rebackRecommendModel];
				[self rebackShopModel];
			
				RACTuple *tuple = [RACTuple tupleWithObjects: @([self rebackType]), nil];
						
				[subscriber sendNext:tuple];
										
			}];
			return nil;
		 }];
}
```
setupModel是我们对外提供的接口，Controller通过调用setupModel方法来发送网络请求。由于有多个请求，所以这里使用combineLatest方法来监听所有请求都请求完成，方法里的reBack...，这几个方法是对数据的再次解析，只需要分解出界面需要的数据。

下面我们用拿ProductSkuModel作为例子，看看每个Model的请求过程:

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-1a9b6a89532739f8.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
-(RACSignal *)setupDescModel{
	    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
			[[RACScheduler mainThreadScheduler]afterDelay:0.5 schedule:^{
				NSDictionary *dic = [self readJsonFile:@"ProductDetailModel.json"];
				self.productInfo = [Wareinfo mj_objectWithKeyValues:dic[@"wareInfo"]];
				[subscriber sendNext:@"1"];
				[subscriber sendCompleted];

			}];
					        
			return [RACDisposable disposableWithBlock:^{
								            
			}];
		}];
}
```
我们需要分析一下这个方法
- 返回值：是一个RACSignal，signal作为RAC的核心，这里不多解释。
- 参数： 由于我们没有实现真实的网络请求，这里就没有提供参数，如果真实项目可能需要传入itemId等。
- 内容： 我们使用[[RACScheduler mainThreadScheduler]afterDelay:0.5 schedule:^{ }];来进行延时处理(加固RAC的使用)，大家也可以使用dispatch sleep来延时，效果一样。
然后通过文件读取方法读取文件，由于是json所以保存在dic中。
使用MJExtension来对json进行解析，这里可以去github上搜一下。
之后我们需要将解析完成的数据放到self.productInfo中，调用sendNext来发送信号

为什么不直接将解析的数据直接send出去呢，考虑原因主要是因为，我们会发现我们会有多个网络请求，我们需要的是所有的网络请求都请求到后才统一对数据进行处理，而我们又不知道哪一个会先请求完。其次，使用RAC的combineLatest方法在分解id x的时候会比较复杂，所以这里我们直接保存到self中。

由于需要先获取到数据，然后在根据数据来创建界面，哪些显示，哪些不显示，于是这里我们用到枚举，样子大概是这样。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-54a236dbdb9fd416.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

屏幕小了些，请谅解。

```
typedef enum : NSUInteger {
	    PRODUCTVIEWTYPENONE = 1 << 0,
		    /**
			 *  自营
	         */
		PRODUCTVIEWTYPEWITHSELF= 1 << 1,
			/**
		     *  全球购
	         */
		PRODUCTVIEWTYPEWITHGLOBAL = 1 << 2,
		    /**
		     *  是否有广告
	         */
	    PRODUCTVIEWTYPEWITHAD = 1 << 3,
		    /**
		      *  打折优惠
		      */
	    PRODUCTVIEWTYPEDISCOUNT = 1 << 4,
		    /**
     	      *  原价
			  */
		PRODUCTVIEWTYPEMPRICE = 1 << 5,
		    /**
		      *  促销
		      */
		PRODUCTVIEWTYPEPROMOTION = 1 << 6,
			/**
			  *  优惠券
			  */
		PRODUCTVIEWTYPECOUPON = 1 << 7,
			/**
			  *  作者
			  */
	    PRODUCTVIEWTYPEAUTHOR = 1 << 8,
			/**
			  *  出版社
			  */
	    PRODUCTVIEWTYPEPRESS = 1 << 9,
											    
} PRODUCTVIEWTYPE;
```
其次说一个比较尴尬的点，我没有找到自营与全球购的flag。于是程序运行没有显示。

于是我们的ViewModel里就出现了这样的一个方法。根据数据如果有需要显示的就将其"或"到type里。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-08c846ce8ba428ea.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

在setupModel中将这个类型sendNext出去。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-bef1c9008cf1609c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这里为什么要用到tuple呢，主要是考虑是否一起讲其他数据一起返回过去，后来发现如果一起返回过去就属于赋值了，而缺少了ViewModel与View的绑定。所以这里只返回了type。

接下来就是比较关键的一个地方了，数据处理与绑定。

我们以商品的广告位来举例。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-f05f8da57fc4c268.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
//设置广告
    NSMutableAttributedString *adAttributStr = nil;
	    if (self.productInfo.ad.adword.length != 0) {
			        adAttributStr = [[NSMutableAttributedString alloc]initWithString:self.productInfo.ad.adword];
					        NSRange range = [self.productInfo.ad.adword rangeOfString:self.productInfo.ad.adLinkContent];
							        [adAttributStr addAttribute:NSLinkAttributeName value:[NSURL URLWithString:self.productInfo.ad.adLink] range:range];
									        //广告价格赋值
									        self.ad = adAttributStr;
											    }
```
首先我们根据adword的长度来判断是否有广告，如果有我们才会进一步处理。我们来看一下数据。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-b9b729e4da858f3f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

广告内容在adword里，链接部分是adLinkContent，链接网址在adLink里，这是一个带有链接的string，所以我们使用adword给NSMutableAttributedString赋值，然后获取到adword在adLinkContent中的range，使用NSLinkAttributeName是range里的变为链接。

到这里我们的数据处理就完成了，如果不适用ViewModel，这些代码我们就需要写在Controller中，Controller也就复杂了很多。

处理完成我们需要在.h中将其公开。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-52f782d1b657136b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这样ViewModel里的工作也就算是处理完了。

接下来就需要回到Controller里面，使用RACObserve来监听我们ViewModel里的每个值，使用RAC来给要赋值的View里各个控件的属性赋值即可。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-e10320094adb7f52.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这样我们在ViewModel中给ad赋值的时候，就会监听到，然后赋值给adLb的attributedText属性。

经过这样的处理我们的Controller里的代码也没有过百行。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-62c522a9999c57ab.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

OK，我知道的也就这么多了，如果有更好的方法，欢迎交流。

>写在最后,如果发现数据很乱，不是一个商品的，不要慌，为了测试一些东西，所以数据弄得乱了一些，不过还好不影响项目。

>写在最后的最后，项目里面会发现为什么轮播图没有显示，是这样的，这个东西，我调了好久，最后发现是因为webp图片个问题，而这个问题我想使用SDWebImage的SDWebImage/WebP来解决，可惜，网络不给力，提示下面的问题。

```
[!] Error installing libwebp
[!] /usr/bin/git clone https://chromium.googlesource.com/webm/libwebp /var/folders/qc/115mp6bj7hq0wjrmyqvhsvqm0000gn/T/d20170331-5309-1tf8x8d --single-branch --depth 1 --branch v0.5.0

Cloning into '/var/folders/qc/115mp6bj7hq0wjrmyqvhsvqm0000gn/T/d20170331-5309-1tf8x8d'...
fatal: unable to access 'https://chromium.googlesource.com/webm/libwebp/': Failed to connect to chromium.googlesource.com port 443: Operation timed out
```
大家不要急，待我弄好之后会回来更新的，我还会回来的！
***
强势分割线，欢迎回来的我！
***
清明时节雨纷纷，虽然没有下雨但是听着歌，也挺不错。

言归正传，我们来解决一下webp格式问题，之前提到使用SDWebView无法解决webp格式图片问题。突然发现我误会人家了，人家提供了处理webp格式的方法。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-24868eb1b47d7c18.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

来我们来翻译一下这句话的意思，默认只引入了Core，如果你需要Webp你需要明确引入，也就是需要在Podfile中需要添加
```
pod 'SDWebImage/WebP'
```
于是我们的Podfile变成了这样

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-dcf133a42ee58716.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

恩，官网这么说，那就这么来吧。

执行:
```
pod update --verbose --no-repo-update
```
如果你看了下面的界面，不要担心很正常。原因，连接googlesource失败，恩，谁让webp是人家google发明的呢，很开心，中国由于限制连不上google的。于是你需要一个终极的方法VPN，只有这个能拯救你。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-caaf90fcad38d4f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

使用后。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-3eea396dbe8d65f1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

安装完成后，你需要看一个地方

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-896c77dc986866e5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如果你发现这里没有SD_WEBP=1需要加上，然后使用就很简单了。

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-b50ef18b8d37cdd5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

跟平时使用sd_webImage一样。运行！

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1503554-7524c5acfbd823f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

到这里算是结束了。

简书地址:http://www.jianshu.com/p/345b741231a9
个人blog:http://hezhengjian.com/

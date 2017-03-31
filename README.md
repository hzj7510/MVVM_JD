# MVVM_JendModel]]] subscribeNext:^(id x) {
									            
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

简书地址:http://www.jianshu.com/p/345b741231a9

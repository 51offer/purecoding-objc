# purecoding-objc


@: 51offer Objective-C Coding Standards

本文档不仅仅限定代码风格，同时在项目结构、Xcode 插件、Snippets 等方面提出指导建议。旨在为开发者提供清晰易上手的代码环境，同时促进写出易读易维护的代码。


## 改进
- 本文档有错的地方确认后立即直接改掉；
- 对本项目有任何改进意见创建 issues 讨论；
- 确定要修改后发起人在 issues/#id 分支提交内容，全部 iOS 开发 code review 后 merge 到 master;


## Xcode

### Xcode 配置
- Set: Perferences -> Text Editing -> Page guide at column: 100.

### 插件

#### 必备插件
- [Alcatraz](http://alcatraz.io/)
- BBUncrustifyPlugin
- VVDocumenter
- XAlign


#### 推荐插件

- KSImageNamed
- ColorSense
- BBUDEbuggerTuckAway
- BBUFullIssueNavigator
- deriveddata-exterminator
- SCXcodeSwitchExpander
- FuzzyAutocomplete
- ACCodeSnippetRepository
- Peckham
- ACCodeSnippetRepositoryPlugin
- CodePilot
- DBSmartPanels
- DXXcodeConsoleUnicodePlugin
- HighlightSelectedString
- RRConstraintsPlugin


## 参考
- [objc-zen-book](https://github.com/objc-zen/objc-zen-book) [中文版](https://github.com/oa414/objc-zen-book-cn) **大幅参考**
- [NYTimes Objective-C Style Guide](https://github.com/NYTimes/objetive-c-style-guide) [中文版](https://github.com/VincentSit/NYTimes-Objective-C-Style-Guide-ZH) **大幅参考**
- [Coding Guidelines for Cocoa](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html)
- [Apple Objective-C conventions](https://developer.apple.com/library/ios/documentation/cocoa/conceptual/ProgrammingWithObjectiveC/Conventions/Conventions.html): 来自苹果的代码约定
- [wonderful-objective-c-style-guide](https://github.com/markeissler/wonderful-objective-c-style-guide)

## 语法细节

** 注，本文档大幅参考了 [NYTimes Objective-C Style Guide](https://github.com/NYTimes/objetive-c-style-guide) 和 [objc-zen-book](https://github.com/objc-zen/objc-zen-book) [中文版](https://github.com/oa414/objc-zen-book-cn) **

### 目录

- [注释](#注释)
- [命名](#命名)
- [点语法](#点语法)
- [间距](#间距)
- [条件判断](#条件判断)
	- [三目运算符](#三目运算符)
- [错误处理](#错误处理)
- [方法](#方法)
- [变量](#变量)
- [Init 和 Dealloc](#init-和-dealloc)
- [字面量](#字面量)
- [CGRect 函数](#CGRect-函数)
- [常量](#常量)
- [枚举类型](#枚举类型)
- [位掩码](#位掩码)
- [私有属性](#私有属性)
- [图片命名](#图片命名)
- [布尔](#布尔)
- [单例](#单例)
- [导入](#导入)
- [Xcode 工程](#Xcode-工程)


### 命名

- 控件统一用控件名作为后缀
- Model 类对于可能混淆类型的变量加类型后缀
- 属性和局部变量应该使用驼峰命名法并且首字母小写。
- 对于已知的英文缩写，统一使用大写：如 `OFFURL`, `OFFHTTPRequest`

#### 前缀

- 统一使用三字母前缀
- 项目文件前缀与项目英文名一致，如 51offer 用 `OFF-`， Visa 用 `VIS-`
- 我们有 objc 代码库 FORLibrary ，与项目无关的通用组件统一用 `FOR-` 前缀
- 所有category方法必须加上前缀 `for_`

#### 后缀缩写

- Btn - UIButton
- Str - NSString
- Arr - NSArray
- Img - UIImage
- ImgView - UIImageView

```objc
UIButton *		settingsBtn;

NSArray *		usersArr;
NSData *		usersSata;

NSString *		createdStr;
NSdate *		createdDate;

```




### 注释

- 我们目前的注释并不用于生成文档
- **注释应该解释为什么这样做，外部调用者要注意什么（坑），而不是做了什么**
- 注释格式统一用 `VVDocument` 生成
- 无用的，与当前情况不符的注释立即删掉
- 没用的（或者暂时不用的）代码立即删掉，而不是注释掉

### 点语法

应该 **始终** 使用点语法来访问或者修改属性，访问其他实例时首选括号。

```objc
view.backgroundColor = [UIColor orangeColor];
[UIApplication sharedApplication].delegate;
```

## 间距

- 一个缩进使用 4 个空格，永远不要使用制表符（tab）缩进。请确保在 Xcode 中设置了此偏好。
- 方法的大括号和其他的大括号（`if`/`else`/`switch`/`while` 等等）始终和声明在同一行开始，在新的一行结束。
- 合理的利用空行分割逻辑关系: 方法间至少空一行，统一函数内不同逻辑至少空一行。

```objc
if (user.isHappy) {
// Do something
}
else {
// Do something else
}
```


## 条件判断

- 条件判断大括号不可省略
- 判断条件多于 2 个的情况下必须抽离出临时变量让代码更可读

```objc
if (!error) {
    return success;
}

BOOL isVIPUser = a == 1 && b == 2 && c != 3;
if (isVIPUser) {
	return success;
}
```

### 三目运算符

只有当它可以增加代码清晰度或整洁时才使用。单一的条件都应该优先考虑使用。多条件时通常使用 if 语句会更易懂，或者重构为实例变量。

```objc
result = a > b ? x : y;
```

## 错误处理

当引用一个返回错误参数（error parameter）的方法时，应该针对返回值，而非错误变量。**易犯错**

```objc
NSError *error;
if (![self trySomethingWithError:&error]) {
    // 处理错误
}
```

一些苹果的 API 在成功的情况下会写一些垃圾值给错误参数（如果非空），所以针对错误变量可能会造成虚假结果（以及接下来的崩溃）。

## 变量

**推荐：**

```objc
@interface OFFSection: NSObject

@property (nonatomic) NSString *headline;

@end
```

#### 变量限定符

**不理解**

当涉及到[在 ARC 中被引入][Variable_Qualifiers_1]变量限定符时，
限定符 (`__strong`, `__weak`, `__unsafe_unretained`, `__autoreleasing`) 应该位于星号和变量名之间，如：`NSString - __weak text`。

[Variable_Qualifiers_1]:(https://developer.apple.com/library/ios/releasenotes/objectivec/rn-transitioningtoarc/Introduction/Introduction.html#//apple_ref/doc/uid/TP40011226-CH1-SW4)


## 字面量

- 每当创建 `NSString`， `NSDictionary`， `NSArray`，和 `NSNumber` 类的不可变实例时，都应该使用字面量
- 合理使用 `@()` 提升代码可读性
- 要注意 `nil` 值不能传给 `NSArray` 和 `NSDictionary` 字面量，这样做会导致崩溃。

```objc
NSArray *names = @[@"Brian", @"Matt", @"Chris", @"Alex", @"Steve", @"Paul"];
NSDictionary *productManagers = @{@"iPhone" : @"Kate", @"iPad" : @"Kamal", @"Mobile Web" : @"Bill"};
NSNumber *shouldUseLiterals = @YES;
NSNumber *buildingZIPCode = @10018;

DDDebugLog(@"count:%@", @(users.count));
```

## CGRect 函数

**坑**
当访问一个 `CGRect` 的 `x`， `y`， `width`， `height` 时，应该使用[`CGGeometry` 函数][CGRect-Functions_1]代替直接访问结构体成员。苹果的 `CGGeometry` 参考中说到：

> All functions described in this reference that take CGRect data structures as inputs implicitly standardize those rectangles before calculating their results. For this reason, your applications should avoid directly reading and writing the data stored in the CGRect data structure. Instead, use the functions described here to manipulate rectangles and to retrieve their characteristics.


```objc
CGRect frame = self.view.frame;

CGFloat x = CGRectGetMinX(frame);
CGFloat y = CGRectGetMinY(frame);
CGFloat width = CGRectGetWidth(frame);
CGFloat height = CGRectGetHeight(frame);
```

[CGRect-Functions_1]:http://developer.apple.com/library/ios/#documentation/graphicsimaging/reference/CGGeometry/Reference/reference.html

## 常量

- 常量首选内联字符串字面量或数字，因为常量可以轻易重用并且可以快速改变而不需要查找和替换。
- 常量应该声明为 `static` 常量而不是 `#define` ，除非非常明确地要当做宏来使用。

**推荐：**

```objc
static const NSString * OFFAboutViewControllerCompanyName = @"The New York Times Company";

static const CGFloat OFFImageThumbnailHeight = 50.0;
```

## 枚举类型

当使用 `enum` 时，建议使用新的基础类型规范，因为它具有更强的类型检查和代码补全功能。

```objc
typedef NS_ENUM(NSInteger, OFFAdRequestState) {
    OFFAdRequestStateInactive,
    OFFAdRequestStateLoading
};
```

## 位掩码

当用到位掩码时，使用 `NS_OPTIONS` 宏。

**举例：**

```objc
typedef NS_OPTIONS(NSUInteger, OFFAdCategory) {
OFFAdCategoryAutos      = 1 << 0,
OFFAdCategoryJobs       = 1 << 1,
OFFAdCategoryRealState  = 1 << 2,
OFFAdCategoryTechnology = 1 << 3
};
```


## 私有属性



## 图片命名

图片名称应该被统一命名以保持组织的完整。它们应该被命名为一个说明它们用途的驼峰式字符串，其次是自定义类或属性的无前缀名字（如果有的话），然后进一步说明颜色 和/或 展示位置，最后是它们的状态。

**推荐：**

- `RefreshBarButtonItem` / `RefreshBarButtonItem@2x` 和 `RefreshBarButtonItemSelected` / `RefreshBarButtonItemSelected@2x`
- `ArticleNavigationBarWhite` / `ArticleNavigationBarWhite@2x` 和 `ArticleNavigationBarBlackSelected` / `ArticleNavigationBarBlackSelected@2x`.

图片目录中被用于类似目的的图片应归入各自的组中。


## 布尔

因为 `nil` 解析为 `NO`，所以没有必要在条件中与它进行比较。永远不要直接和 `YES` 进行比较，因为 `YES` 被定义为 1，而 `BOOL` 可以多达 8 位。

这使得整个文件有更多的一致性和更大的视觉清晰度。

**推荐：**

```objc
if (!someObject) {
}
```

**反对：**

```objc
if (someObject == nil) {
}
```

-----

**对于 `BOOL` 来说, 这有两种用法:**

```objc
if (isAwesome)
if (![someObject boolValue])
```

**反对：**

```objc
if ([someObject boolValue] == NO)
if (isAwesome == YES) // 永远别这么做
```

-----

如果一个 `BOOL` 属性名称是一个形容词，属性可以省略 “is” 前缀，但为 get 访问器指定一个惯用的名字，例如：

```objc
@property (assign, getter=isEditable) BOOL editable;
```

内容和例子来自 [Cocoa 命名指南][Booleans_1] 。

[Booleans_1]:https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingIvarsAndTypes.html#//apple_ref/doc/uid/20001284-BAJGIIJE


## 单例

- 单例对象应该使用线程安全的模式创建共享的实例
- 统一使用 FORSinglenton.h


[Singletons_1]:http://cocoasamurai.blogspot.com/2011/04/singletons-your-doing-them-wrong.html

### import   

- 如果有一个以上的 import 语句，就对这些语句进行[分组][Import_1]
- 每个分组的注释是可选的。   
- 对于模块使用 [@import][Import_2] 语法。   

```objc   
// Frameworks
@import QuartzCore;

// Models
#import "OFFUser.h"

// Views
#import "OFFButton.h"
#import "OFFUserView.h"
```   

[Import_1]: http://ashfurrow.com/blog/structuring-modern-objective-c
[Import_2]: http://clang.llvm.org/docs/Modules.html#using-modules

## Xcode 工程

- 为了避免文件杂乱，物理文件必须保持和 Xcode 项目文件同步。即 Xcode 创建的任何组（group）都必须在文件系统有相应的映射
- 为了更清晰，代码不仅应该按照类型进行分组，也可以根据功能进行分组。

### 警告

- 重视警告，develop 分支提交的代码不该有警告存在；
- 引入第三方库的警告可以通过 pod :inhibit_warnings => true 忽略
- 如果可以的话，尽可能一直打开 target Build Settings 中 "Treat Warnings as Errors" 以及一些[额外的警告][Xcode-project_1]。如果你需要忽略指定的警告,使用 [Clang 的编译特性][Xcode-project_2] 。 **还没看**


[Xcode-project_1]:http://boredzo.org/blog/archives/2009-11-07/warnings
[Xcode-project_2]:http://clang.llvm.org/docs/UsersManual.html#controlling-diagnostics-via-pragmas

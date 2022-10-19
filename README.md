# 项目说明

项目目录说明：  
- Ald.xcworkspace： Xcode 项目配置文件，可直接使用 Xcode 打开运行  
- AldAnalytics： Framework 项目源码工程，可使用 Xcode 打开  
- AldAnalytics.podspec： CocoaPods 配置文件，根据需要修改发版内容  
- AldAnalytics.xcframework： 编译后的 Framework，用于发布  
- build_framework.sh： 打包脚本  
- Example： 示例工程  
- README.md  
- sa-sdk-ios： 神策 iOS SDK 源码项目工程  

# 打包脚本

直接在当前目录执行打包脚本，在命令行中输入入下的命令  
sudo ./build_framework.sh  
即可编译生成 AldAnalytics.xcframework

# 发版说明

SDK 目前发版主要是使用 CocoaPods。所以需要在本地安装 CocoaPods。

## 代码上传

CocoaPods 基于 GitHub，所以发版需要将相关文件发到 GitHub。  
GitHub 上的代码必须需要包括：AldAnalytics.xcframework、AldAnalytics.podspec。  
如果 GitHub 上需要带上 Demo，可以把 Example 文件夹一同上传。  

## CocoaPods

修改 AldAnalytics.podspec 文件中相关配置。主要是 source 和 version 字段。  
- source 改成阿拉丁的仓库地址  
- version 发布的版本  

将修改提交，注意：该文件的 version 需要和 tag 版本一致。  

## 打 tag

在 GitHub 上打 tag。例如：tag 版本为 0.0.1，那么上面的 AldAnalytics.podspec 中 version 字段也应该是 0.0.1。  

## 发布

进入 GitHub 代码的目录，执行下面的命令：    
pod trunk push AldAnalytics.podspec --allow-warnings    
这个命令需要国际网络支持，而且比较慢。请耐心等待。  

## 参考

如果 CocoaPods 使用上有什么问题，可以参考：https://www.jianshu.com/p/2e7661bf3318 上的一些说明。  

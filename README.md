# CSafariWebKit

A framework to browser web from your app and easily configured it.


## Overview

It works as a wrapper for [SFSafariViewController](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller) and [WKWebView](https://developer.apple.com/documentation/webkit/wkwebview) that helps with customizations, takes away the need to implement delegates and uncovers the intelligence of browsing the web from inside of your app.

## Getting Started


### Prerequisites

Your app's target should be at least iOS 9.0. And if you are not cloning it, then you will need CocoaPods.


### Installing

You can either clone it and add it as a Framework or you can use it as a dependency from [CocoaPods](https://cocoapods.org/)


#### CocoaPods

Go to your Podfile and add:

```ruby
pod `CSafariWebKit`
```

Then in your terminal run:

```
pod install
```

Now you can open __YourApp.xcworkspace__


### How to use it

First import the Framework in a ViewController that you want to use it.

```swift
import CSafariWebKit
```

#### SFSafariViewController

You can either receive it as a UIViewController to be presented :

```swift
let vc = WebView.safari.load(url: url)
self.present(vc, animated: true, completion: nil)
```

Or you can present it directly from your ViewController

```swift
WebView.safari.present(url: url, from: self)

WebView.safari.present(url: url, from: self, whenDidClose: { doSomething() })

WebView.safari.present(url: url, from: self, whenDidClose: { doSomething() })

WebView.safari.present(url: url, from: self, dismissButtonStyle: .cancel,
                 whenDidClose: { doSomething() })
                 
WebView.safari.present(url: url, from: self, dismissButtonStyle: .cancel,
                 barTintColor: .blue, tintColor: .white, whenDidClose: { doSomething() })
                 
WebView.safari.present(url: url, from: self, dismissButtonStyle: .cancel,
                 presentModally: true, barCollapsingEnabled: true, entersReaderIfAvailable: true,
                 barTintColor: .blue, tintColor: .white, whenDidClose: { doSomething() })
```

Where:
* __url__ - The URL to be loaded.
* __previousViewController__ - The ViewController that will present the Browser.
* __dismissButtonStyle__ - Indicates which button should be shown in SafariViewController to close it.
* __presentModally__ - Indicates if SafariViewController should be presented modally.
* __barCollapsingEnabled__ - Should enable collapsing of the navigation bar and hiding of the bottom toolbar when the user scrolls web content.
* __entersReaderIfAvailable__ - Indicates if SafariViewController should automatically show the Reader version of web pages. This will only happen when Safari Reader is available on a web page.
* __barTintColor__ - The tint color to apply to the navigation bar background.
* __tintColor__ - The tint color to apply to the navigation items and bar button items.
* __whenDidClose__ - A method used as a callback when the user closes the Browser.


#### WKWebView

You can either receive it as a UIViewController to be presented :

```swift
let vc = WebView.webview.load(url: url)
self.present(vc, animated: true, completion: nil)
```

Or you can present it directly from your ViewController

```swift
WebView.wkWebView.present(url: url, from: self)

WebView.wkWebView.present(url: url, from: self, whenDidClose: { doSomething() })

WebView.wkWebView.present(url: url, from: self, whenDidClose: { doSomething() })

WebView.wkWebView.present(url: url, from: self, closeButtonName: "Close", buttonSide: .left, 
                  barTintColor: .blue, tintColor: .white, whenDidClose: { doSomething() })
                 
WebView.wkWebView.present(url: url, from: self, closeButtonName: "Close", buttonSide: .left,
                  barTintColor: .blue, tintColor: .white, title: "My Screen", whenDidClose: { doSomething() })
                 
WebView.wkWebView.present(url: url, from: self, closeButtonName: "Close", buttonSide: .left,
                  barTintColor: .blue, tintColor: .white, title: "My Screen", 
                  userAgent: userAgent, whenDidClose: { doSomething() })
```

Where:
* __url__ - The URL to be loaded.
* __previousViewController__ - The ViewController that will present the Browser.
* __closeButtonName__ - Set a custom name to use as dismiss button.
* __closeButtonName__ - Set a custom name to use as dismiss button.
* __buttonSide__ - Indicates wich side the button should be presented.
* __barTintColor__ - The tint color to apply to the navigation bar background.
* __tintColor__ - The tint color to apply to the navigation items and bar button items.
* __title__ - Set a title for NavigationBar.
* __userAgent__ - Append a UserAgent to your WebView.
* __whenDidClose__ - A method used as a callback when the user closes the Browser.


#### Framework

Clone this project, copy CSafariWebKit.framework to your project. Then and go to Xcode and follow these steps.

1. Select the project file from the project navigator on the left side of the project window.
2. Select the target for where you want to add frameworks in the project settings editor.
3. Select the “Build Phases” tab, and click the small triangle next to “Link Binary With Libraries” to view all of the frameworks in your application.
4. To Add frameworks, click the “+” below the list of frameworks.

![](http://docs.onemobilesdk.aol.com/ios-ad-sdk/adding-frameworks.png)

## Built With

* [CocoaPods](https://cocoapods.org/) - Dependency Management


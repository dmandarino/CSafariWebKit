# CSafariWebKit

A framework to browser web from your app and easily configured it.


## Overview

It works as a wrapper for [SFSafariViewController](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller) and [WKWebView](https://developer.apple.com/documentation/webkit/wkwebview) that helps with customizations, takes away the need to implement delegates and uncovers the intelligence of browsing the web from inside of your app.

## Getting Started


### Prerequisites

Your app's target should be at least iOS 11.0. And if you are not cloning it, then you will need CocoaPods.


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
    
    WebView.safari.present(url: URL, from previousViewController: UIViewController)
    
    WebView.safari.present(url: URL,
                           from previousViewController: UIViewController,
                           whenDidClose didClose: (() -> Void)?)
    
    WebView.safari.present(url: URL,
                           from previousViewController: UIViewController,
                           dismissButtonStyle: DismissButtonStyle,
                           whenDidClose didClose: (() -> Void)?)
    
    WebView.safari.present(url: URL,
                           from previousViewController: UIViewController,
                           dismissButtonStyle: DismissButtonStyle,
                           barTintColor: UIColor?,
                           tintColor: UIColor?,
                           whenDidClose didClose: (() -> Void)?)
    
    WebView.safari.present(url: URL,
                           from previousViewController: UIViewController,
                           dismissButtonStyle: DismissButtonStyle,
                           presentModally: Bool,
                           barCollapsingEnabled: Bool,
                           entersReaderIfAvailable: Bool,
                           barTintColor: UIColor?,
                           tintColor: UIColor?,
                           whenDidClose didClose: (() -> Void)?)
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
    WebView.wkWebView.present(url: URL, from previousViewController: UIViewController)
    
    WebView.wkWebView.present(url: URL,
                             from previousViewController: UIViewController,
                             whenDidClose didClose: (() -> Void)?)
    
    WebView.wkWebView.present(url: URL,
                             from previousViewController: UIViewController,
                             closeButtonName: String?,
                             buttonSide: ButtonSide,
                             barTintColor: UIColor?,
                             tintColor: UIColor?,
                             whenDidClose didClose: (() -> Void)?)
    
    WebView.wkWebView.present(url: URL,
                             from previousViewController: UIViewController,
                             closeButtonName: String?,
                             buttonSide: ButtonSide,
                             barTintColor: UIColor?,
                             tintColor: UIColor?,
                             title: String?,
                             whenDidClose didClose: (() -> Void)?)
    
    WebView.wkWebView.present(url: URL,
                             from previousViewController: UIViewController,
                             closeButtonName: String?,
                             buttonSide: ButtonSide,
                             barTintColor: UIColor?,
                             tintColor: UIColor?,
                             title: String?,
                             userAgent: String,
                             whenDidClose didClose: (() -> Void)?)
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

## Built With

* [CocoaPods](https://cocoapods.org/) - Dependency Management


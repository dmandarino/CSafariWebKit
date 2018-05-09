# CSafariWebKit

A framework to browser web from your app and easily configured it.


## Overview

It works as a wrapper for [SFSafariViewController](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller) that helps with customizations, takes away the need to implement delegates and uncovers the intelligence of browsing the web from inside of your app.


## When do I use it?

According to [Apple's Documentation](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller): 

```
If your app lets users view websites from anywhere on the Internet, use the SFSafariViewController class...

When you adopt SFSafariViewController and a user presses a link to peek at and then pop to the link’s destination, the user views web content from within your app. Tapping Done, the user returns to the view controller that was displayed before the web content was loaded. 
```
Also, only __SFSafariViewController__ is enabled to use Apple Pay.


## Getting Started


### Prerequisites

Your app's target should be at least iOS 9.0. And if you are not cloning it, then you should have CocoaPods.


### Installing

You can either clone it and add it as a Framework or you can use it as a dependency from [CocoaPods](https://cocoapods.org/)


#### Git Clone

Clone this project and got to Xcode and follow these steps.

1. Select the project file from the project navigator on the left side of the project window.
2. Select the target for where you want to add frameworks in the project settings editor.
3. Select the “Build Phases” tab, and click the small triangle next to “Link Binary With Libraries” to view all of the frameworks in your application.
4. To Add frameworks, click the “+” below the list of frameworks.

![](http://docs.onemobilesdk.aol.com/ios-ad-sdk/adding-frameworks.png)


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
 
 To use it:
 
```swift
let vc = SafariViewController(url: url, barTintColor: nil, tintColor: nil)
vc.presentSafari(fromViewController: self, whenDidFinish: nil)
```

Where:
* __url__ - The URL you want to be presented.
* __barTintColor__ - Customized color for NavigationBar
* __tintColor__ - Customized color for text in NavigationBar
* __fromViewController__ - The ViewController that will present the Browser.
* __whenDidFinish__ - A method used as a callback when the user closes the Browser.

#### Customizations


```swift
vc.barCollapsingEnabled = true
vc.entersReaderIfAvailable = true
vc.dismissButtonStyle = .close
vc.presentModally = true
```

Where:
* __barCollapsingEnabled (default: false)__ - Should enable collapsing of the navigation bar and hiding of the bottom toolbar when the user scrolls web content.
* __entersReaderIfAvailable (default: false)__ - Indicates if SafariViewController should automatically show the Reader version of web pages. This will only happen when Safari Reader is available on a web page.
* __dismissButtonStyle (default: done)__ - Indicates wich button should be shown in SafariViewController to close it. You can choose between "Close", "Done" and "Cancel".
* __presentModally (default: false)__ - Indicates that SafariViewController should be presented modally. 


## Built With

* [CocoaPods](https://cocoapods.org/) - Dependency Management


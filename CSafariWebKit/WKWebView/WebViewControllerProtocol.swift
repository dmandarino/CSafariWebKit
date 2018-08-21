//
//  WebViewControllerProtocol.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 21/08/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import WebKit
import UIKit

protocol WebViewControllerProtocol {
    /**
     Create a WKWebView and return it as an UIView.
     
     - returns:
     A WKWebView as an UIView
     
     - Parameters:
     - url: The URL to be loaded.
     */
    func load(url: URL) -> UIView
    /**
     Present WKWebView from the previous ViewController.
     
     If you don't set any color for *barTintColor* or *tintColor*, it will use the same colors from previous NavigationBar or default color.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController)
    /**
     Present WKWebView from the previous ViewController.
     
     If you don't set any color for *barTintColor* or *tintColor*, it will use the same colors from previous NavigationBar or default color.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     - whenDidClose: A method used as a callback when the user closes the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController, whenDidClose didClose: (() -> Void)?)
    /**
     Present WKWebView from the previous ViewController.
     
     If you don't set any color for *barTintColor* or *tintColor*, it will use the same colors from previous NavigationBar or default color.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     - closeButtonName: Set a custom name to use as dismiss button.
     - buttonSide: Indicates wich side the button should be presented.
     - barTintColor: The tint color to apply to the navigation bar background.
     - tintColor: The tint color to apply to the navigation items and bar button items.
     - whenDidClose: A method used as a callback when the user closes the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController, closeButtonName: String?, buttonSide: ButtonSide, barTintColor: UIColor?, tintColor: UIColor?, whenDidClose didClose: (() -> Void)?)
    /**
     Present WKWebView from the previous ViewController.
     
     If you don't set any color for *barTintColor* or *tintColor*, it will use the same colors from previous NavigationBar or default color.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     - closeButtonName: Set a custom name to use as dismiss button.
     - buttonSide: Indicates wich side the button should be presented.
     - barTintColor: The tint color to apply to the navigation bar background.
     - tintColor: The tint color to apply to the navigation items and bar button items.
     - title: Set a title for NavigationBar
     - whenDidClose: A method used as a callback when the user closes the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController, closeButtonName: String?, buttonSide: ButtonSide, barTintColor: UIColor?, tintColor: UIColor?, title: String?, whenDidClose didClose: (() -> Void)?)
    /**
     Present WKWebView from the previous ViewController.
     
     If you don't set any color for *barTintColor* or *tintColor*, it will use the same colors from previous NavigationBar or default color.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     - closeButtonName: Set a custom name to use as dismiss button.
     - buttonSide: Indicates wich side the button should be presented.
     - barTintColor: The tint color to apply to the navigation bar background.
     - tintColor: The tint color to apply to the navigation items and bar button items.
     - title: Set a title for NavigationBar
     - userAgent: Append a UserAgent to your WebView
     - whenDidClose: A method used as a callback when the user closes the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController, closeButtonName: String?, buttonSide: ButtonSide,  barTintColor: UIColor?, tintColor: UIColor?, title: String?, userAgent: String, didClose: (() -> Void)?)
}

//
//  SafariViewControllerProtocol.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 21/08/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import UIKit

public protocol SafariViewControllerProtocol {
    /**
     Create a SFSafariViewController and return it as an UIViewController.
     
     - returns:
     A SFSafariViewController as an UIViewController
     
     - Parameters:
     - url: The URL to be loaded.
     */
    func load(url: URL) -> UIViewController
    /**
     Present SFSafariViewController from the previous ViewController.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController)
    /**
     Present SFSafariViewController from the previous ViewController.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     - whenDidClose: A method used as a callback when the user closes the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController, whenDidClose didClose: (() -> Void)?)
    /**
     Present SFSafariViewController from the previous ViewController.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     - dismissButtonStyle: Indicates which button should be shown in SafariViewController to close it.
     - whenDidClose: A method used as a callback when the user closes the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController, dismissButtonStyle: DismissButtonStyle,
                 whenDidClose didClose: (() -> Void)?)
    /**
     Present SFSafariViewController from the previous ViewController.
     
     If you don't set any color for *barTintColor* or *tintColor*, it will use the same colors from previous NavigationBar or default color.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     - dismissButtonStyle: Indicates which button should be shown in SafariViewController to close it.
     - barTintColor: The tint color to apply to the navigation bar background.
     - tintColor: The tint color to apply to the navigation items and bar button items.
     - whenDidClose: A method used as a callback when the user closes the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController, dismissButtonStyle: DismissButtonStyle,
                 barTintColor: UIColor?, tintColor: UIColor?, whenDidClose didClose: (() -> Void)?)
    /**
     Present SFSafariViewController from the previous ViewController.
     
     If you don't set any color for *barTintColor* or *tintColor*, it will use the same colors from previous NavigationBar or default color.
     
     - Parameters:
     - url: The URL to be loaded.
     - previousViewController: The ViewController that will present the Browser.
     - dismissButtonStyle: Indicates which button should be shown in SafariViewController to close it.
     - presentModally: Indicates if SafariViewController should be presented modally.
     - barCollapsingEnabled: Should enable collapsing of the navigation bar and hiding of the bottom toolbar when the user scrolls web content.
     - entersReaderIfAvailable: Indicates if SafariViewController should automatically show the Reader version of web pages. This will only happen when Safari Reader is available on a web page.
     - barTintColor: The tint color to apply to the navigation bar background.
     - tintColor: The tint color to apply to the navigation items and bar button items.
     - whenDidClose: A method used as a callback when the user closes the Browser.
     */
    func present(url: URL, from previousViewController: UIViewController, dismissButtonStyle: DismissButtonStyle,
                 presentModally: Bool, barCollapsingEnabled: Bool, entersReaderIfAvailable: Bool,
                 barTintColor: UIColor?, tintColor: UIColor?, whenDidClose didClose: (() -> Void)?)
}

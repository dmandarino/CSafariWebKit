//
//  SafariViewController.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 04/05/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import UIKit
import SafariServices

public class SafariViewController: UIViewController {
    
    /**
     Indicates if SafariViewController should automatically show the Reader version of web pages. This will only happen when Safari Reader is available on a web page.
     
     - Attention: Only apply for SDK: iOS 11.0+
     */
    public var entersReaderIfAvailable: Bool = false {
        didSet {
            if #available(iOS 11.0, *) {
                SafariConfiguration.entersReaderIfAvailable = entersReaderIfAvailable
            }
        }
    }
    
    /**
     Should enable collapsing of the navigation bar and hiding of the bottom toolbar when the user scrolls web content.
     
     - Attention: Only apply for SDK: iOS 11.0+
     */
    public var barCollapsingEnabled: Bool = false {
        didSet {
            if #available(iOS 11.0, *) {
                SafariConfiguration.barCollapsingEnabled = barCollapsingEnabled
            }
        }
    }
    
    /**
     Indicates which button should be shown in SafariViewController to close it.
     
     - Attention: Only apply for SDK: iOS 11.0+
     */
    public var dismissButtonStyle: DismissButtonStyle = DismissButtonStyle.done {
        didSet {
            if #available(iOS 11.0, *) {
                self.safariViewController?.dismissButtonStyle = dismissButtonStyle.getStyle()
            }
        }
    }
    
    /**
     Indicates if SafariViewController should be presented modally.
     */
    public var presentModally: Bool = false {
        didSet {
            if presentModally {
                self.safariViewController?.modalPresentationStyle = UIModalPresentationStyle.popover
            }
        }
    }
    
    fileprivate var safariViewController: SFSafariViewController?
    fileprivate var tintColor: UIColor?
    fileprivate var currentURL: URL?
    fileprivate var barTintColor: UIColor?
    fileprivate var handler: (() -> ())?
    
    public init(url: URL, barTintColor: UIColor?, tintColor: UIColor?) {
        super.init(nibName: nil, bundle: nil)
        self.currentURL = url
        self.tintColor = tintColor
        self.barTintColor = barTintColor
        createSafariViewController()
        configureSafariViewController()
    }
    
    internal convenience init(url: URL, barTintColor: UIColor?, tintColor: UIColor?,
                     safariViewControllerMock: SFSafariViewController) {
        self.init(url: url, barTintColor: barTintColor, tintColor: tintColor)
        self.safariViewController = safariViewControllerMock
        configureSafariViewController()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSafariViewController() {
        guard let url = currentURL else {
            NSLog("Error: URL Bad Format.")
            return
        }
        if #available(iOS 11.0, *) {
            let safariConfiguration = SafariConfiguration.configuration
            safariViewController = SFSafariViewController(url: url, configuration: safariConfiguration!)
        } else {
            safariViewController = SFSafariViewController(url: url)
        }
    }
    
    private func configureSafariViewController() {
        safariViewController?.delegate = self
        setColors()
    }
    
    private func setColors() {
        if let bar = barTintColor {
            if #available(iOS 10.0, *) {
                safariViewController?.preferredBarTintColor = bar
            } else {
                safariViewController?.view.tintColor = bar
            }
        }
        if let tint = tintColor {
            if #available(iOS 10.0, *) {
                safariViewController?.preferredControlTintColor = tint
            }
        }
    }
}

extension SafariViewController {
    
    /**
     Present SafariViewController from the previous ViewController.
     
     - parameters:
        - previousViewController: The ViewController that will present the Browser.
        - handler: A method used as a callback when the user closes the Browser.
     */
    public func presentSafari(fromViewController previousViewController: UIViewController, whenDidFinish handler: (() -> Void)?) {
        guard safariViewController != nil else {
            return
        }
        self.handler = handler
        previousViewController.present(safariViewController!, animated: true, completion: nil)
        previousViewController.present(self, animated: true, completion: nil)
    }
}

extension SafariViewController: SFSafariViewControllerDelegate {
    
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        guard let completion = handler else {
            return
        }
        completion()
    }
}

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
     
     -Important:
     Only works for iOS 11.0 and higher.
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
     
     -Important:
     Only works for iOS 11.0 and higher.
     */
    public var barCollapsingEnabled: Bool = false {
        didSet {
            if #available(iOS 11.0, *) {
                SafariConfiguration.barCollapsingEnabled = barCollapsingEnabled
            }
        }
    }
    
    /**
     Indicates wich button should be shown in SafariViewController to close it. You can choose between "Close", "Done" and "Cancel".
     
     -Important:
     Only works for iOS 11.0 and higher.
     */
    public var dismissButtonStyle: DismissButtonStyle = DismissButtonStyle.done {
        didSet {
            if #available(iOS 11.0, *) {
                self.safariViewController?.dismissButtonStyle = dismissButtonStyle.getStyle()
            }
        }
    }
    
    /**
     Indicates that SafariViewController should be presented modally.
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
        setupSafariViewController()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSafariViewController() {
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
     
     - Parameters:
     - previousViewController: The ViewController that will present the Browser.
     - handler: A method used as a callback when the user closes the Browser.
     */
    public func presentSafari(fromViewController previousViewController: UIViewController, whenDidFinish handler: (() -> Void)?) {
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


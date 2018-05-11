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
    
    public var entersReaderIfAvailable: Bool = false {
        didSet {
            if #available(iOS 11.0, *) {
                SafariConfiguration.entersReaderIfAvailable = entersReaderIfAvailable
            }
        }
    }
    
    public var barCollapsingEnabled: Bool = false {
        didSet {
            if #available(iOS 11.0, *) {
                SafariConfiguration.barCollapsingEnabled = barCollapsingEnabled
            }
        }
    }
    
    public var dismissButtonStyle: DismissButtonStyle = DismissButtonStyle.done {
        didSet {
            if #available(iOS 11.0, *) {
                self.safariViewController?.dismissButtonStyle = dismissButtonStyle.getStyle()
            }
        }
    }
    
    public var presentModally: Bool = false {
        didSet {
            if presentModally {
                self.safariViewController?.modalPresentationStyle = UIModalPresentationStyle.popover
            }
        }
    }
    
    private var safariViewController: SFSafariViewController?
    private var tintColor: UIColor?
    private var currentURL: URL?
    private var barTintColor: UIColor?
    private var handler: (() -> ())?
    
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

extension SafariViewController: SafariViewControllerProtocol {
    
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


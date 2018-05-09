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
            self.safariConfiguration?.entersReaderIfAvailable = entersReaderIfAvailable
        }
    }
    
    public var barCollapsingEnabled: Bool = false {
        didSet {
            self.safariConfiguration?.barCollapsingEnabled = barCollapsingEnabled
        }
    }
    
    public var dismissButtonStyle: DismissButtonStyle = DismissButtonStyle.done {
        didSet {
            self.safariViewController?.dismissButtonStyle = dismissButtonStyle.getStyle()
        }
    }
    
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
    fileprivate var safariConfiguration: SFSafariViewController.Configuration?
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
        safariConfiguration = SFSafariViewController.Configuration()
        safariViewController = SFSafariViewController(url: url, configuration: safariConfiguration!)
        safariViewController?.delegate = self
        setColors()
    }
    
    private func setColors() {
        if let bar = barTintColor {
            safariViewController?.preferredBarTintColor = bar
        }
        if let tint = tintColor {
            safariViewController?.preferredControlTintColor = tint
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

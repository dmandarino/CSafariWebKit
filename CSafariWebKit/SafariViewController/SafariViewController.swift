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
    
    private var entersReaderIfAvailable: Bool = false {
        didSet {
            if #available(iOS 11.0, *) {
                SafariConfiguration.entersReaderIfAvailable = entersReaderIfAvailable
            }
        }
    }
    private var barCollapsingEnabled: Bool = false {
        didSet {
            if #available(iOS 11.0, *) {
                SafariConfiguration.barCollapsingEnabled = barCollapsingEnabled
            }
        }
    }
    private var dismissButtonStyle: DismissButtonStyle = DismissButtonStyle.done {
        didSet {
            if #available(iOS 11.0, *) {
                self.safariViewController?.dismissButtonStyle = dismissButtonStyle.getStyle()
            }
        }
    }
    private var presentModally: Bool = false {
        didSet {
            if presentModally {
                self.safariViewController?.modalPresentationStyle = UIModalPresentationStyle.popover
            }
        }
    }
    private var safariViewController: SFSafariViewController!
    private var didClose: (() -> ())?
}

extension SafariViewController: SafariViewControllerProtocol {
    
    public func load(url: URL) -> UIViewController {
        return buildSafariViewController(forURL: url)
    }
    
    public func present(url: URL, from previousViewController: UIViewController) {
        present(url: url, from: previousViewController, dismissButtonStyle: self.dismissButtonStyle,
                presentModally: self.presentModally, barCollapsingEnabled: self.barCollapsingEnabled,
                entersReaderIfAvailable: self.entersReaderIfAvailable,
                barTintColor: nil, tintColor: nil, whenDidClose: nil)
    }
    
    public func present(url: URL, from previousViewController: UIViewController, whenDidClose didClose: (() -> Void)?) {
        present(url: url, from: previousViewController, dismissButtonStyle: self.dismissButtonStyle,
                presentModally: self.presentModally, barCollapsingEnabled: self.barCollapsingEnabled,
                entersReaderIfAvailable: self.entersReaderIfAvailable,
                barTintColor: nil, tintColor: nil, whenDidClose: didClose)
    }
    
    public func present(url: URL, from previousViewController: UIViewController, dismissButtonStyle: DismissButtonStyle,
                        whenDidClose didClose: (() -> Void)?) {
        present(url: url, from: previousViewController, dismissButtonStyle: dismissButtonStyle,
                presentModally: self.presentModally, barCollapsingEnabled: self.barCollapsingEnabled,
                entersReaderIfAvailable: self.entersReaderIfAvailable,
                barTintColor: nil, tintColor: nil, whenDidClose: didClose)
    }
    
    public func present(url: URL, from previousViewController: UIViewController, dismissButtonStyle: DismissButtonStyle,
                        barTintColor: UIColor?, tintColor: UIColor?, whenDidClose didClose: (() -> Void)?) {
        present(url: url, from: previousViewController, dismissButtonStyle: dismissButtonStyle,
                presentModally: self.presentModally, barCollapsingEnabled: self.barCollapsingEnabled,
                entersReaderIfAvailable: self.entersReaderIfAvailable,
                barTintColor: barTintColor, tintColor: tintColor, whenDidClose: didClose)
    }
    
    public func present(url: URL, from previousViewController: UIViewController, dismissButtonStyle: DismissButtonStyle,
                        presentModally: Bool, barCollapsingEnabled: Bool, entersReaderIfAvailable: Bool,
                        barTintColor: UIColor?, tintColor: UIColor?, whenDidClose didClose: (() -> Void)?) {
        self.didClose = didClose
        safariViewController = buildSafariViewController(forURL: url)
        setupSafariConfiguration(dismissButtonStyle: dismissButtonStyle, presentModally: presentModally,
                                 barCollapsingEnabled: barCollapsingEnabled, entersReaderIfAvailable: entersReaderIfAvailable)
        setupColors(from: previousViewController, barTintColor: barTintColor, tintColor: tintColor)
        presentSafariViewController(previousViewController: previousViewController)
    }
    
    private func setupSafariConfiguration(dismissButtonStyle: DismissButtonStyle, presentModally: Bool,
                                          barCollapsingEnabled: Bool, entersReaderIfAvailable: Bool) {
        self.safariViewController?.delegate = self
        self.entersReaderIfAvailable = entersReaderIfAvailable
        self.dismissButtonStyle = dismissButtonStyle
        self.barCollapsingEnabled = barCollapsingEnabled
        self.presentModally = presentModally
    }
    
    private func buildSafariViewController(forURL url: URL) -> SFSafariViewController {
        if #available(iOS 11.0, *) {
            let safariConfiguration = SafariConfiguration.configuration
            return SFSafariViewController(url: url, configuration: safariConfiguration)
        } else {
            return SFSafariViewController(url: url)
        }
    }
    
    private func presentSafariViewController(previousViewController: UIViewController) {
        previousViewController.present(safariViewController, animated: true, completion: nil)
        previousViewController.present(self, animated: true, completion: nil)
    }
    
    private func setupColors(from previousViewController: UIViewController, barTintColor: UIColor?, tintColor: UIColor?) {
        if #available(iOS 10.0, *) {
            safariViewController?.preferredBarTintColor = barTintColor ?? previousViewController.navigationController?.navigationBar.barTintColor
            safariViewController?.preferredControlTintColor = tintColor ?? previousViewController.navigationController?.navigationBar.tintColor
        } else {
            safariViewController?.view.tintColor = tintColor ?? previousViewController.navigationController?.navigationBar.tintColor
        }
    }
}

extension SafariViewController: SFSafariViewControllerDelegate {
    
    public func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        guard let completion = didClose else {
            return
        }
        completion()
    }
}

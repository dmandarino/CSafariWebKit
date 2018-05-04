//
//  SafariViewController.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 04/05/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import UIKit
import SafariServices

class SafariViewController: UIViewController {
    
    var entersReaderIfAvailable: Bool = false {
        didSet {
            self.safariConfiguration?.entersReaderIfAvailable = entersReaderIfAvailable
        }
    }
    
    var barCollapsingEnabled: Bool = false {
        didSet {
            self.safariConfiguration?.barCollapsingEnabled = barCollapsingEnabled
        }
    }
    
    var dismissButtonStyle: DismissButtonStyle = DismissButtonStyle.close {
        didSet {
            self.safariViewController?.dismissButtonStyle = dismissButtonStyle.getStyle()
        }
    }
    
    var presentModally: Bool = false {
        didSet {
            if presentModally {
                safariViewController?.modalPresentationStyle = UIModalPresentationStyle.popover
            }
        }
    }
    
    private var safariViewController: SFSafariViewController?
    private var currentURL: URL?
    private var tintColor: UIColor?
    private var barTintColor: UIColor?
    private var safariConfiguration: SFSafariViewController.Configuration?
    private var handler: (() -> ())?
    
    init(tintColor: UIColor, barTintColor: UIColor, url: URL) {
        super.init(nibName: nil, bundle: nil)
        self.currentURL = url
        self.tintColor = tintColor
        self.barTintColor = barTintColor
        setupSafariViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
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
        setTintColor()
    }
    
    private func setTintColor() {
        if #available(iOS 10.0, *) {
            safariViewController?.preferredBarTintColor = tintColor
            safariViewController?.preferredControlTintColor = barTintColor
        } else {
            safariViewController?.view.tintColor = tintColor
        }
    }
}

extension SafariViewController: SafariViewControllerProtocol {
    
    func configureToBePresented(currentViewController: UIViewController, didFinish handler: @escaping () -> Void) {
        guard let viewController = safariViewController else {
            NSLog("Error: SafariViewController has not been initialized properly.")
            return
        }
        self.handler = handler
        currentViewController.present(viewController, animated: true, completion: nil)
    }
}

extension SafariViewController: SFSafariViewControllerDelegate {
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        guard let completion = handler else {
            return
        }
        completion()
    }
}

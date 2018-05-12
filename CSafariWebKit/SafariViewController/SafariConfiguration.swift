//
//  SafariConfiguration.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 11/05/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import SafariServices

@available(iOS 11.0, *)
struct SafariConfiguration {
    
    static var entersReaderIfAvailable: Bool = false {
        didSet {
            self.customizedConfiguration.entersReaderIfAvailable = entersReaderIfAvailable
        }
    }
    
    static var barCollapsingEnabled: Bool = false {
        didSet {
            self.customizedConfiguration.barCollapsingEnabled = barCollapsingEnabled
        }
    }
    
    static var configuration: SFSafariViewController.Configuration? {
        return customizedConfiguration
    }
    
    static private var customizedConfiguration = SFSafariViewController.Configuration()
}

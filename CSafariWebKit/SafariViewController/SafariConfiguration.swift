//
//  SafariConfiguration.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 11/05/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import SafariServices

struct SafariConfiguration {
    
    static var entersReaderIfAvailable: Bool = false {
        didSet {
            self.configuration.entersReaderIfAvailable = entersReaderIfAvailable
        }
    }
    
    static var barCollapsingEnabled: Bool = false {
        didSet {
            self.configuration.barCollapsingEnabled = barCollapsingEnabled
        }
    }
    
    static var configuration: SFSafariViewController.Configuration = SFSafariViewController.Configuration()
}

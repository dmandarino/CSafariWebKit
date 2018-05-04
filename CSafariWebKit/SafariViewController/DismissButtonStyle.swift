//
//  DismissButtonStyle.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 04/05/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import SafariServices

enum DismissButtonStyle {
    
    case cancel
    case close
    case done
    
    func getStyle() -> SFSafariViewController.DismissButtonStyle {
        switch self {
        case .cancel:
            return SFSafariViewController.DismissButtonStyle.cancel
        case .close:
            return SFSafariViewController.DismissButtonStyle.close
        case .done:
            return SFSafariViewController.DismissButtonStyle.done
        }
    }
}

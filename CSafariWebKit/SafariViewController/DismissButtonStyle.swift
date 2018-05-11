//
//  DismissButtonStyle.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 04/05/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import SafariServices

public enum DismissButtonStyle {
    
    case cancel
    case close
    case done
    
    @available(iOS 11.0, *)
    public func getStyle() -> SFSafariViewController.DismissButtonStyle {
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

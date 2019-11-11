//
//  DismissButtonStyle.swift
//  CSafariWebKit
//
//  Created by Douglas Mandarino on 04/05/18.
//  Copyright © 2018 Douglas Mandarino. All rights reserved.
//

import SafariServices

public enum DismissButtonStyle {
    
    /// Dismiss button style will be set as Cancel
    case cancel
    /// Dismiss button style will be set as Close
    case close
    /// Dismiss button style will be set as Done
    case done
    
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

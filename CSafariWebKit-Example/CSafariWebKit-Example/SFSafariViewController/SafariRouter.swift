//
//  SafariOptions.swift
//  CSafariWebKit-Example
//
//  Created by Douglas Mandarino on 25/08/20.
//  Copyright © 2020 Douglas Mandarino. All rights reserved.
//

import UIKit
import CSafariWebKit

protocol SafariOptionsProtocol {
    func getComponents() -> [ItemMenu]
}

final class SafariRouter: SafariOptionsProtocol {
    
    private var viewController: UIViewController
    private var components: [ItemMenu] = []
    private let url = URL(string: "https://github.com/dmandarino/CSafariWebKit")!
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func getComponents() -> [ItemMenu] {
        self.components.append(ItemMenu(name: "Load", action: loadURL))
        self.components.append(ItemMenu(name: "Present Default", action: showDefault))
        self.components.append(ItemMenu(name: "Bla", action: config))
    
        return self.components
    }
    
    private func config() {}
    
    private func loadURL() {
        let safari = WebView.safari.load(url: url)
        viewController.present(safari, animated: true, completion: nil)
    }
    
    private func showDefault() {
        WebView.safari.present(url: url, from: viewController)
    }
}

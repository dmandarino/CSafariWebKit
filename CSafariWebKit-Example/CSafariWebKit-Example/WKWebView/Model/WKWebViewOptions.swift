//
//  WKWebViewRouter.swift
//  CSafariWebKit-Example
//
//  Created by Douglas Mandarino on 28/06/20.
//  Copyright © 2020 Douglas Mandarino. All rights reserved.
//

import UIKit

protocol WKWebViewRouterProtocol {
    func getComponents() -> [ItemMenu]
}

class WKWebViewRouter: WKWebViewRouterProtocol {

    private var components: [ItemMenu] = []

    func getComponents() -> [ItemMenu] {
        self.components.append(ItemMenu(name: "Bla", action: config))
        self.components.append(ItemMenu(name: "Bla", action: config))
        self.components.append(ItemMenu(name: "Bla", action: config))
    
        return self.components
    }
    
    private func config() {}
}

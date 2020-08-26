//
//  ItemMenu.swift
//  Playkit-iOS-Example
//
//  Created by Douglas Mandarino on 04/10/19.
//  Copyright © 2019 globo.com. All rights reserved.
//

import Foundation

struct ComponentMenu {
    let name: String
    let itemMenu: [ItemMenu]
}

struct ItemMenu {
    let name: String
    let action: () -> Void
}

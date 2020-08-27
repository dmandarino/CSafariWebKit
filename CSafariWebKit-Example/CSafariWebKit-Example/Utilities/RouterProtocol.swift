//
//  RouterProtocol.swift
//  CSafariWebKit-Example
//
//  Created by Douglas Mandarino on 26/08/20.
//  Copyright © 2020 Douglas Mandarino. All rights reserved.
//

import Foundation
import UIKit

protocol RouterProtocol {
    var components: [ItemMenu] { get set }
    var viewController: UIViewController { get }
    func getComponents() -> [ItemMenu]
}

extension RouterProtocol {
    
    var url: URL {
        return URL(string: "https://github.com/dmandarino/CSafariWebKit")!
    }
    
    func whenDidClose() {
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        let alert = UIAlertController(title: "Did Close", message: nil, preferredStyle: .alert)
        alert.addAction(action)
        viewController.present(alert, animated: true, completion: nil)
    }
}

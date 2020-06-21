//
//  ViewController.swift
//  CSafariWebKit-Example
//
//  Created by Douglas Mandarino on 14/06/20.
//  Copyright © 2020 Douglas Mandarino. All rights reserved.
//

import UIKit
import CSafariWebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openSafari(_ sender: Any) {
        let url = URL(string: "http://google.com")!
        let vc = WebView.safari.load(url: url)
        self.present(vc, animated: true, completion: nil)
    }
    
}


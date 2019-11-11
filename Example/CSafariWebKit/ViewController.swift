//
//  ViewController.swift
//  CSafariWebKit
//
//  Created by mandarino.douglas@me.com on 03/03/2019.
//  Copyright (c) 2019 mandarino.douglas@me.com. All rights reserved.
//

import UIKit
import CSafariWebKit

class ViewController: UIViewController {
    
    private let url = URL(string: "https://google.com")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.tintColor = .systemBackground
        } else {
            self.navigationController?.navigationBar.tintColor = .white
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openSafariViewController(_ sender: Any) {
        let viewController = WebView.safari.load(url: url)
        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func openWebView(_ sender: Any) {
        WebView.wkWebView.present(url: url, from: self, whenDidClose: {
            let alert = UIAlertController(title: "Invalid URL", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "Close", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        })
    }
    
    private func presentError() {
        let alert = UIAlertController(title: "Invalid URL", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}


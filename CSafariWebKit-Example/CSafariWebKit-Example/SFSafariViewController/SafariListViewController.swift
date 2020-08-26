//
//  WKWebViewController.swift
//  CSafariWebKit-Example
//
//  Created by Douglas Mandarino on 28/06/20.
//  Copyright © 2020 Douglas Mandarino. All rights reserved.
//

import UIKit

class SafariListViewController: UIViewController {
    
    private var options: [ItemMenu] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isAccessibilityElement = true
        self.tableView.accessibilityIdentifier = "tableView"
        
        configureComponentsList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Private Methods
    
    private func configureComponentsList() {
        self.options = SafariRouter(viewController: self).getComponents()
    }
}

extension SafariListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let labels: [String.SubSequence]
        labels = self.options[indexPath.row].name.split(separator: ":")
        cell.textLabel?.text = String(labels.first!)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.options[indexPath.row].action()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

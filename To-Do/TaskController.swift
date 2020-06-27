//
//  TaskController.swift
//  To-Do
//
//  Created by kadir ince on 27.06.2020.
//  Copyright © 2020 Kadir Ince. All rights reserved.
//

import UIKit

class TaskController: UITableViewController {
    override func viewDidLoad() {
        viewBackground()
        createSearchBar()
    }

    func viewBackground() {
        let gradient = CAGradientLayer()
        navigationController?.navigationBar.barTintColor = .white
        gradient.colors = [#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.8431372549, green: 0.8823529412, blue: 0.9254901961, alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0.7, y: 0.2)
        gradient.endPoint = CGPoint(x: 1, y: 0.9)
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
    }

    func createSearchBar() {
        navigationItem.searchController = UISearchController(searchResultsController: nil)
    }
}

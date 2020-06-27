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
        createSearchBar()
        navigationItem.title = "Todo for " + findTodayDate()

        
    }

    func createSearchBar() {
        navigationItem.searchController = UISearchController(searchResultsController: nil)
    }

    func findTodayDate() -> String {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "dd/MM"
        return formatter.string(from: currentDateTime)
    }
}

//    MARK: - Data Source


extension TaskController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "ToDo"
        return cell
    }
}

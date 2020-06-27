//
//  TaskController.swift
//  To-Do
//
//  Created by kadir ince on 27.06.2020.
//  Copyright © 2020 Kadir Ince. All rights reserved.
//

import UIKit

class TaskController: UITableViewController {
    var taskStore = TaskStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        navigationItem.title = "Today is " + findTodayDate()
    }

    @IBAction func addTask(_ sender: UIBarButtonItem) {
        // Setting up alert controller
        let alertController = UIAlertController(title: "What We Do?", message: nil, preferredStyle: .alert)

        // Set up the actions
        let addAction = UIAlertAction(title: "Add", style: .default) { _ in
            guard let name = alertController.textFields?.first?.text else { return }
            let newTask = Task(name: name)
            self.taskStore.add(newTask, at: 0)
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        // Add the text field
        alertController.addTextField { textField in
            textField.placeholder = "Enter task name..."
        }

        // Add the actions
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        // Show alert
        present(alertController, animated: true)
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
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "For Today" : "Done"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return taskStore.tasks.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskStore.tasks[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = taskStore.tasks[indexPath.section][indexPath.row].name
        return cell
    }
}

// MARK: - Delegate

extension TaskController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { _, _, completionHandler in
            let isDone = self.taskStore.tasks[indexPath.section][indexPath.row].isDone
            self.taskStore.removeTask(at: indexPath.row, isDone: isDone)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        deleteAction.image = #imageLiteral(resourceName: "delete")
        deleteAction.backgroundColor = #colorLiteral(red: 0.930943534, green: 0.3925783351, blue: 0.3048926327, alpha: 1)

        return UISwipeActionsConfiguration(actions: [deleteAction])
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let doneAction = UIContextualAction(style: .destructive, title: nil) { _, _, completionHandler in
            self.taskStore.tasks[0][indexPath.row].isDone = true
            let doneTask = self.taskStore.removeTask(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            self.taskStore.add(doneTask, at: 0,isDone: true)
            tableView.insertRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
            completionHandler(true)
        }
        doneAction.image = #imageLiteral(resourceName: "done")
        doneAction.backgroundColor = #colorLiteral(red: 0.4423159247, green: 1, blue: 0.1009471318, alpha: 1)

        return indexPath.section == 0 ? UISwipeActionsConfiguration(actions: [doneAction]) : nil
    }
}

//
//  TaskStore.swift
//  To-Do
//
//  Created by kadir ince on 27.06.2020.
//  Copyright © 2020 Kadir Ince. All rights reserved.
//

import Foundation

class TaskStore {
    var tasks = [[Task](), [Task]()]

//    add tasks
    func add(_ task: Task, at index: Int, isDone: Bool = false) {
        let section = isDone ? 1 : 0
        tasks[section].insert(task, at: index)
    }

//     remove tasks
   @discardableResult func removeTask(at index: Int, isDone: Bool = false) -> Task {
        let section = isDone ? 1 : 0
        return tasks[section].remove(at: index)
    }
}

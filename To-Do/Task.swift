//
//  Task.swift
//  To-Do
//
//  Created by kadir ince on 27.06.2020.
//  Copyright © 2020 Kadir Ince. All rights reserved.
//

import Foundation

class Task {
    var name: String
    var isDone: Bool

    init(name: String, isDone: Bool = false) {
        self.name = name
        self.isDone = isDone
    }
}

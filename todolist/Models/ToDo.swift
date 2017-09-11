//
//  File.swift
//  todolist
//
//  Created by Andreas Schmitt on 11.09.17.
//  Copyright © 2017 Andreas Schmitt. All rights reserved.
//

import Foundation

struct ToDo {
    let toDoName: String
    let toDoDueDate: Date
    let toDoCategory: ToDoCategory?
    
    init(name toDoName: String, dueDate toDoDueDate: Date, category toDoCategory: ToDoCategory?) {
        self.toDoName = toDoName
        self.toDoDueDate = toDoDueDate
        guard let category = toDoCategory else {
            self.toDoCategory = nil
            return
        }
        self.toDoCategory = category
    }
}

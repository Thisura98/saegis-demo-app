//
//  MainItemViewModel.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import Foundation

class MainItemViewModel{
    var taskName: String
    var dueDate: Date
    var status: TaskStatus
    
    init(_ task: String, _ due: Date, _ taskStatus: TaskStatus){
        taskName = task
        dueDate = due
        status = taskStatus
    }
}

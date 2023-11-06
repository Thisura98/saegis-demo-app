//
//  TaskStatusEnum.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import Foundation

enum TaskStatus: Int, CustomStringConvertible{
    case todo, inProgress, done
    
    var description: String{
        switch(self){
        case .todo: return "Todo"
        case .inProgress: return "In progress"
        case .done: return "Done"
        }
    }
}

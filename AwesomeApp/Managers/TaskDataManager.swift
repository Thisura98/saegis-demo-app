//
//  TaskDataManager.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import Foundation

class TaskDataManager: BaseManager{
    
    private var demoTasks: [MainItemViewModel] = []
    
    override func initialize() {
        createDemoData()
    }
    
    func loadData() async -> [MainItemViewModel]{
        try? await Task.sleep(seconds: 3)
        return demoTasks
    }
    
    private func createDemoData(){
        // TODO: Load from JSON
    }
    
}

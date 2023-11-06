//
//  TaskDataManager.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import Foundation

class TaskDataManager: BaseManager{
    
    private var demoTasks: [MainItemViewModel] = []
    private var initializeTask: Task<Bool, Never>!
    
    override func initialize() {
        initializeTask = createDemoData()
    }
    
    func loadData() async -> [MainItemViewModel]{
        // Artificial delay of 3 seconds + wait for data to finish loading
        try? await Task.sleep(seconds: 3)
        _ = await initializeTask.result
        return demoTasks
    }
    
    private func getTasksFileContents() throws -> String{
        let path = Bundle.main.path(forResource: "tasks", ofType: "json")
        return try String(contentsOfFile: path!) // force try for demo purposes
    }
    
    private func getDecoder() -> JSONDecoder{
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
    
    private func convertTasks(_ response: TaskResponse) -> [MainItemViewModel]{
        return response.tasks?.map({ item in
            return MainItemViewModel(item.title ?? "Unknown title", item.dueDate ?? Date.now, .todo)
        }) ?? []
    }
    
    private func createDemoData() -> Task<Bool, Never>{
        // Run in background thread
        return Task.detached {
            do{
                try await Task.sleep(seconds: 3)
                let tasksJson = try self.getTasksFileContents()
                let decoder = self.getDecoder()
                let response = try decoder.decode(TaskResponse.self, from: tasksJson.data(using: .utf8)!)
                self.demoTasks = self.convertTasks(response)
            }
            catch(let error){
                print("TaskDataManager Error:", error)
            }
            
            return true as Bool
        }
    }
    
}

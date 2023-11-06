//
//  ViewController.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import UIKit

final class MainController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private let manager = TaskDataManager.getInstance()
    private var data = [MainItemViewModel].init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Awesome App"
        navigationController!.navigationBar.prefersLargeTitles = true
        
        setupTableView()
        loadData()
    }

    private func setupTableView(){
        MainTableViewCell.register(inTableView: tableView)
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 100.0
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func loadData() {
        Task{ 
            data = await manager.loadData()
            tableView.reloadData()
        }
    }

}

extension MainController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count > 0 ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MainTableViewCell.dequeue(from: tableView, data[indexPath.row])
    }
    
    
    // TODO
    
}


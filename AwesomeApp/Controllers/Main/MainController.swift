//
//  ViewController.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import UIKit

final class MainController: UIViewController {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var crashButton: UIButton!
    
    private let manager = TaskDataManager.getInstance()
    private var data = [MainItemViewModel].init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Awesome App"
        navigationController!.navigationBar.prefersLargeTitles = true
        
        setStyles()
        setupTableView()
        loadData()
    }
    
    private func setStyles(){
        crashButton.layer.cornerRadius = 12
    }

    private func setupTableView(){
        MainTableViewCell.register(inTableView: tableView)
        tableView.rowHeight = UITableView.automaticDimension;
        tableView.estimatedRowHeight = 100.0
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setIsLoading(_ loading: Bool){
        tableView.isHidden = loading
        activityIndicator.isHidden = !loading
        if (loading){
            activityIndicator.startAnimating()
        }
    }
    
    private func loadData() {
        Task{ 
            setIsLoading(true)
            data = await manager.loadData()
            setIsLoading(false)
            tableView.reloadData()
        }
    }

    @IBAction func crashButtonTapped(_ sender: Any) {
        // The following logic will crash the app
        [0, 1, 2][3]
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
    
}


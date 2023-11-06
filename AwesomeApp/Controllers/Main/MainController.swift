//
//  ViewController.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import UIKit

final class MainController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Awesome App"
        navigationController!.navigationBar.prefersLargeTitles = true
        
        setupTableView()
    }

    private func setupTableView(){
        MainTableViewCell.register(inTableView: tableView)
    }

}


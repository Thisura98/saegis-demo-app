//
//  MainTableViewCell.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import UIKit

class MainTableViewCell: BaseTableViewCell<MainItemViewModel> {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    
    override func setup(_ viewModel: MainItemViewModel) {
        titleLabel.text = viewModel.taskName
        statusLabel.text = viewModel.status.description
        dueDateLabel.text = viewModel.formattedDate()
    }
    
}

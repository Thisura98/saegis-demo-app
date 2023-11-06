//
//  BaseTableViewCell.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import UIKit
import Foundation

class BaseTableViewCell<TItemViewModel>: UITableViewCell where TItemViewModel: AnyObject{
    
    private static var identifier: String{
        return String(describing: self)
    }
    
    static func register(inTableView tableView: UITableView){
        let nib = UINib(nibName: identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func dequeue(from tableView: UITableView, _ viewModel: TItemViewModel) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.identifier) as! BaseTableViewCell<TItemViewModel>
        cell.setup(viewModel)
        return cell
    }
    
    open func setup(_ viewModel: TItemViewModel){
        // Override in subclasses
    }
    
}

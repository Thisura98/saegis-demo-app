//
//  BaseManager.swift
//  AwesomeApp
//
//  Created by Thisura Dodangoda on 2023-11-07.
//

import Foundation

class BaseManager{
    
    private static var instance: BaseManager!
    
    required internal init(){}
    
    static func getInstance() -> Self{
        instance = self.init()
        instance.initialize()
        return instance as! Self
    }
    
    open func initialize(){
        // TODO: Add init logic here
    }
    
}

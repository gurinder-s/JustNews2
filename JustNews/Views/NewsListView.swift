//
//  NewsListView.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation
import UIKit
class NewsListView: UIView{
    
    let tableViews: UITableView = UITableView()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setUpTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not init")
    }
    
    func setUpTableView(){
        addSubview(tableViews)
        tableViews.register(UITableViewCell.self, forCellReuseIdentifier: "News Cell")
        //Auto Layout
        tableViews.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViews.topAnchor.constraint(equalTo: self.topAnchor),
            tableViews.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableViews.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableViews.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])
        
    }
    
    
}

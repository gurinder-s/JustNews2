//
//  NewsListController.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation
import UIKit

class NewsListController: UIViewController{
    let newsListView: UIView = NewsListView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(newsListView)
    }
}

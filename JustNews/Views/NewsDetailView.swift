//
//  NewsDetailView.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation
import UIKit
class NewsDetailView: UIView {
    let title = UILabel.autoLayout()
    let newsDescription = UILabel.autoLayout()
    let snippet = UILabel.autoLayout()
    let image = UIImageView()
    let source = UILabel.autoLayout()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init(coder: NSCoder) {
        fatalError("Not implemented")
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor),
            image.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 10),
            newsDescription.topAnchor.constraint(equalTo: image.bottomAnchor, constant:10),
            source.topAnchor.constraint(equalTo: newsDescription.bottomAnchor, constant:10),
            snippet.topAnchor.constraint(equalTo: source.bottomAnchor,constant:10),
            //Center Anchor
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        ])
    }
}

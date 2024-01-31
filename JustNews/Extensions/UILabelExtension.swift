//
//  UILabelExtension.swift
//  JustNews
//
//  Created by G on 31/01/2024.
//

import Foundation
import UIKit

extension UILabel{
    static func autoLayout() -> UILabel{
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}

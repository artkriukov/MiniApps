//
//  Extension+UI.swift
//  Tipsy
//
//  Created by Artem Kriukov on 17.02.2025.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
        self.font = .systemFont(ofSize: 25)
        self.textColor = .lightGray
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.tintColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1)
        self.titleLabel?.font = .systemFont(ofSize: 35)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIButton {
    convenience init(title: String, isActionButton: Bool) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
        self.tintColor = .white
        self.titleLabel?.font = .systemFont(ofSize: 35)
        self.backgroundColor = Constants.greenColor
        self.layer.cornerRadius = 8
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}



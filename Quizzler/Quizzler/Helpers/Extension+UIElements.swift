//
//  Extension+UIElements.swift
//  Quizzler
//
//  Created by Artem Kriukov on 05.02.2025.
//

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis) {
        self.init()
        self.axis = axis
        self.spacing = 20
    }
}

extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
        self.font = .systemFont(ofSize: 30, weight: .bold)
        self.numberOfLines = 0
    }
}

extension UIButton {
    convenience init(text: String) {
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        self.tintColor = .white
        self.titleLabel?.font = .systemFont(ofSize: 25, weight: .bold)
        self.backgroundColor = Constants.backgroundColor
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 3
        self.layer.borderColor = CGColor(red: 74/255, green: 114/255, blue: 168/255, alpha: 1)
    }
}

extension UIProgressView {
    convenience init(progress: Float) {
        self.init(progressViewStyle: .bar)
        self.progress = progress
        self.progressTintColor = Constants.progressTintColor
        self.trackTintColor = Constants.progressTrackColor
    }
}

extension UIImageView {
    convenience init(image: String) {
        self.init()
        self.image = UIImage(named: image)
    }
}

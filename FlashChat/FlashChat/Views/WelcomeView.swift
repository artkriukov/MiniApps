//
//  WelcomeView.swift
//  FlashChat
//
//  Created by Artem Kriukov on 21.02.2025.
//

import UIKit

class WelcomeView: UIView {
    // MARK: - UI
    
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Views and Setup Constraints
private extension WelcomeView {
    func setupViews() {
        backgroundColor = .white
    }
    
    func setupConstraints() {
        
    }
}

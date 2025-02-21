//
//  RegisterView.swift
//  FlashChat
//
//  Created by Artem Kriukov on 21.02.2025.
//

import UIKit
import SnapKit

final class RegisterView: UIView {
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
private extension RegisterView {
    func setupViews() {
        backgroundColor = .systemTeal
        

    }
    
    func setupConstraints() {

    }
}

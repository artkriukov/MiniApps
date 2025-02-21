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

    private lazy var mainStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 8
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let emailTextField = UITextField(
        placeholder: K.emailName,
        color: UIColor(named: K.BrandColors.blue)
    )
    
    private let passwordTextField = UITextField(
        placeholder: K.passwordName,
        color: .black
    )
    
    private let registerButton = UIButton(titleColor: .white, title: "Register")
        
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
    
        addSubview(mainStack)
        mainStack.addArrangedSubview(emailTextField)
        mainStack.addArrangedSubview(passwordTextField)
        mainStack.addArrangedSubview(registerButton)
    }
    
    func setupConstraints() {
        mainStack.snp.makeConstraints { make in
            make.top.leading.bottom.trailing.equalTo(safeAreaLayoutGuide)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.trailing.equalTo(self).inset(36)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.trailing.equalTo(self).inset(36)
        }
    }
}




//
//  WelcomeView.swift
//  FlashChat
//
//  Created by Artem Kriukov on 21.02.2025.
//

import UIKit
import SnapKit

class WelcomeView: UIView {
    
    weak var delegate: WelcomeViewDelegate?
    // MARK: - UI
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.textColor = UIColor(named: K.BrandColors.blue)
        element.font = .systemFont(ofSize: 50, weight: .black)
        element.text = K.appName
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let registerButton = UIButton(
        titleColor: UIColor(named: K.BrandColors.blue),
        title: K.registerName,
        backgroundColor: UIColor(named: K.BrandColors.lightBlue)
    )
    
    private let loginButton = UIButton(
        titleColor: .white,
        title: K.logInName,
        backgroundColor: .systemTeal
    )
    
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonsTapped(_ sender: UIButton) {
        delegate?.buttonsTapped()
    }
}

// MARK: - Setup Views and Setup Constraints
private extension WelcomeView {
    func setupViews() {
        backgroundColor = .white
        
        addSubview(titleLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        
        loginButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        loginButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        registerButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
            make.bottom.equalTo(loginButton.snp.top).offset(-8)
        }
    }
}

extension UIButton {
    convenience init(titleColor: UIColor?, title: String?, backgroundColor: UIColor? = .clear) {
        self.init(type: .system)
        self.titleLabel?.font = .systemFont(ofSize: 30)
        self.tintColor = titleColor
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

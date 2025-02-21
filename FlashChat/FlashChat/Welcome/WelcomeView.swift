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
        animatedText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func animatedText() {
        titleLabel.text = ""
        let titleText = K.appName
        
        for letter in titleText.enumerated() {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(letter.offset), repeats: false) { timer in
                self.titleLabel.text! += String(letter.element)
            }
        }
    }
    
    @objc private func buttonsTapped(_ sender: UIButton) {
        
        if sender.tag == 0 {
            delegate?.registerBbuttonsTapped()
        } else if sender.tag == 1 {
            delegate?.logInButtonsTapped()
        }
        
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
        
        registerButton.tag = 0
        loginButton.tag = 1
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



//
//  CoinView.swift
//  ByteCoin
//
//  Created by Artem Kriukov on 20.02.2025.
//

import UIKit

final class CoinView: UIView {
    
    private lazy var label: UILabel = {
        let element = UILabel()
        element.text = "ByteCoin"
        element.font = .systemFont(ofSize: 50, weight: .medium)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var stackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.layer.borderWidth = 1
        element.layer.borderColor = UIColor.black.cgColor
        element.layer.cornerRadius = 8
        element.distribution = .fill
        element.spacing = 10
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bitcoinImage: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: "bitcoinsign.circle.fill")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var bitcoinLabel: UILabel = {
        let element = UILabel()
        element.text = "1000.00"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    lazy var currencyLabel: UILabel = {
        let element = UILabel()
        element.text = "USD"
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private(set) lazy var currencyPicker: UIPickerView = {
        let element = UIPickerView()
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    init() {
        super.init(frame: .zero)
        setViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CoinView {
    func setViews() {

        addSubview(label)
        addSubview(stackView)
        
        stackView.addArrangedSubview(bitcoinImage)
        stackView.addArrangedSubview(bitcoinLabel)
        stackView.addArrangedSubview(currencyLabel)
        
        addSubview(currencyPicker)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bitcoinImage.widthAnchor.constraint(equalToConstant: 30),
            bitcoinImage.heightAnchor.constraint(equalToConstant: 30),
            
            stackView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            currencyPicker.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            currencyPicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            currencyPicker.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

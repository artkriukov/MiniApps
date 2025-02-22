//
//  MessageCell.swift
//  FlashChat
//
//  Created by Artem Kriukov on 22.02.2025.
//

import UIKit

final class MessageCell: UITableViewCell {
    // MARK: - UI
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 10
        element.alignment = .bottom
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var leftImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "YouAvatar")
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()

    private lazy var rightImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "MeAvatar")
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var messageView: UIView = {
        let element = UIView()
        element.layer.cornerRadius = 12
        element.clipsToBounds = true
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var messageLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 0
        element.font = UIFont.systemFont(ofSize: 16)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    public func configure(model: Message) {
        messageLabel.text = model.body
        
        switch model.sender {
        case .me:
            leftImageView.isHidden = true
            rightImageView.isHidden = false
            messageView.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            messageLabel.textColor = UIColor(named: K.BrandColors.purple)
            mainStackView.alignment = .trailing
        case .you:
            leftImageView.isHidden = false
            rightImageView.isHidden = true
            messageView.backgroundColor = UIColor(named: K.BrandColors.purple)
            messageLabel.textColor = UIColor(named: K.BrandColors.lightPurple)
            mainStackView.alignment = .leading
        }
    }
}

// MARK: - Setup Views and Setup Constraints
private extension MessageCell {
    func setupViews() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(leftImageView)
        mainStackView.addArrangedSubview(messageView)
        mainStackView.addArrangedSubview(rightImageView)
        
        messageView.addSubview(messageLabel)
    }
    
    func setupConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        messageView.snp.makeConstraints { make in
            make.width.lessThanOrEqualToSuperview().multipliedBy(0.9)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        
        leftImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        rightImageView.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
    }
}

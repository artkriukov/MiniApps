////
////  WeatherView.swift
////  Clima
////
////  Created by Artem Kriukov on 26.01.2025.
////
//
//import UIKit
//import SnapKit
//
//class WeatherView: UIView {
//    
//    // MARK: - UI
//     lazy var backgroundImageView: UIImageView = {
//        let element = UIImageView()
//        element.image = UIImage(named: Constants.background)
//        element.contentMode = .scaleAspectFill
//        return element
//    }()
//    
//     lazy var mainStackView: UIStackView = {
//        let element = UIStackView()
//        element.axis = .vertical
//        element.spacing = 10
//        element.alignment = .trailing
//        return element
//    }()
//    
//     lazy var headerStackView: UIStackView = {
//        let element = UIStackView()
//        element.axis = .horizontal
//        element.alignment = .fill
//        element.distribution = .fill
//        return element
//    }()
//    
//    lazy var geoButton: UIButton = {
//        let element = UIButton(type: .system)
//        element.setImage(UIImage(systemName: Constants.geoSF), for: .normal)
//        element.tintColor = .weather
//        return element
//    }()
//    
//    lazy var searchTextField: UITextField = {
//        let element = UITextField()
//        element.borderStyle = .roundedRect
//        element.textAlignment = .right
//        element.font = .systemFont(ofSize: 25)
//        element.textColor = .weather
//        element.tintColor = .weather
//        element.backgroundColor = .systemFill
//        element.placeholder = Constants.search
//        element.autocapitalizationType = .words
//        element.returnKeyType = .go
//        return element
//    }()
//    
//    lazy var searchButton: UIButton = {
//        let element = UIButton(type: .system)
//        element.setImage(UIImage(systemName: Constants.searchSF), for: .normal)
//        element.tintColor = .weather
//        return element
//    }()
//    
//     lazy var coditionalImageView: UIImageView = {
//        let element = UIImageView()
//        element.image = UIImage(systemName: Constants.coditionSF)
//        element.tintColor = .weather
//        return element
//    }()
//    
//     lazy var tempStackView: UIStackView = {
//        let element = UIStackView()
//        element.axis = .horizontal
//        return element
//    }()
//    
//    lazy var tempLabel: UILabel = {
//        let element = UILabel()
//        element.font = .systemFont(ofSize: 80, weight: .black)
//        element.tintColor = .weather
//        return element
//    }()
//    
//    lazy var tempTypeLabel: UILabel = {
//        let element = UILabel()
//        element.font = .systemFont(ofSize: 100, weight: .light)
//        element.tintColor = .weather
//        return element
//    }()
//    
//    lazy var cityLabel: UILabel = {
//        let element = UILabel()
//        element.font = .systemFont(ofSize: 30)
//        element.tintColor = .weather
//        return element
//    }()
//    
//    let emptyView = UIView()
//    
//    // MARK: - Init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupViews()
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Setup UI
//     func setupViews() {
//        addSubview(backgroundImageView)
//        addSubview(mainStackView)
//        
//        mainStackView.addArrangedSubview(headerStackView)
//        headerStackView.addArrangedSubview(geoButton)
//        headerStackView.addArrangedSubview(searchTextField)
//        headerStackView.addArrangedSubview(searchButton)
//        
//        mainStackView.addArrangedSubview(coditionalImageView)
//        mainStackView.addArrangedSubview(tempStackView)
//        tempStackView.addArrangedSubview(tempLabel)
//        tempStackView.addArrangedSubview(tempTypeLabel)
//        
//        mainStackView.addArrangedSubview(cityLabel)
//        mainStackView.addArrangedSubview(emptyView)
//    }
//    
//     func setupConstraints() {
//        backgroundImageView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        
//        mainStackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview().inset(24)
//        }
//        
//        geoButton.snp.makeConstraints { make in
//            make.width.height.equalTo(40)
//        }
//        
//        searchButton.snp.makeConstraints { make in
//            make.width.height.equalTo(40)
//        }
//        
//        coditionalImageView.snp.makeConstraints { make in
//            make.width.height.equalTo(120)
//        }
//    }
//}

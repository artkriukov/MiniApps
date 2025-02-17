//
//  WeatherViewController.swift
//  Clima
//
//  Created by Artem Kriukov on 24.01.2025.
//

import UIKit
import SnapKit
import CoreLocation

class WeatherViewController: UIViewController {

    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: Constants.background)
        element.contentMode = .scaleAspectFill
        return element
    }()
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 10
        element.alignment = .trailing
        return element
    }()
    
    private lazy var headerStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.alignment = .fill
        element.distribution = .fill
        return element
    }()
    
    private lazy var geoButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: Constants.geoSF), for: .normal)
        element.tintColor = .weather
        return element
    }()
    
    lazy var searchTextField: UITextField = {
        let element = UITextField()
        element.borderStyle = .roundedRect
        element.textAlignment = .right
        element.font = .systemFont(ofSize: 25)
        element.textColor = .weather
        element.tintColor = .weather
        element.backgroundColor = .systemFill
        element.placeholder = Constants.search
        element.autocapitalizationType = .words
        element.returnKeyType = .go
        return element
    }()
    
    private lazy var searchButton: UIButton = {
        let element = UIButton(type: .system)
        element.setImage(UIImage(systemName: Constants.searchSF), for: .normal)
        element.tintColor = .weather
        element.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        return element
    }()
    
    lazy var coditionalImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(systemName: Constants.coditionSF)
        element.tintColor = .weather
        return element
    }()
    
    private lazy var tempStackView: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        return element
    }()
    
    lazy var tempLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 80, weight: .black)
        element.tintColor = .weather
        return element
    }()
    
    private lazy var tempTypeLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 100, weight: .light)
        element.tintColor = .weather
        return element
    }()
    
    lazy var cityLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 30)
        element.tintColor = .weather
        return element
    }()
    
    let emptyView = UIView()
    
    // MARK: - Object Properties
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        weatherManager.delegate = self
        searchTextField.delegate = self // Для активации кнопки Go на клавиатуре
        
        setViews()
        setConstraints()
    }

    // MARK: - Private Methods
    
    @objc private func searchButtonPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    // MARK: - setViews
    private func setViews() {
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(headerStackView)
        
        headerStackView.addArrangedSubview(geoButton)
        headerStackView.addArrangedSubview(searchTextField)
        headerStackView.addArrangedSubview(searchButton)
        
        mainStackView.addArrangedSubview(coditionalImageView)
        mainStackView.addArrangedSubview(tempStackView)
        
        tempStackView.addArrangedSubview(tempLabel)
        tempStackView.addArrangedSubview(tempTypeLabel)
        
        
        mainStackView.addArrangedSubview(cityLabel)
        mainStackView.addArrangedSubview(emptyView)
        
        tempLabel.text = "25"
        tempTypeLabel.text = Constants.celsius
        cityLabel.text = "Kiev"
    }
}


extension WeatherViewController {
    
    // MARK: - setConstraints
    private func setConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mainStackView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        geoButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(40)
        }
        
        coditionalImageView.snp.makeConstraints { make in
            make.width.height.equalTo(120)
        }
    }
}


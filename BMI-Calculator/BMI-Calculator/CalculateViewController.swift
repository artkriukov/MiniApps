//
//  CalculateViewController.swift
//  BMI-Calculator
//
//  Created by Artem Kriukov on 22.01.2025.
//

import UIKit

class CalculateViewController: UIViewController {

    // MARK: - UI
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "calculate_background")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 40, weight: .bold)
        element.textColor = .darkGray
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var heightStackView = UIStackView()
    private let heightTitleLabel = UILabel(alignment: .left)
    private let heightNumberLabel = UILabel(alignment: .right)
    private let heightSlider = UISlider(maxValue: 3)
    
    private var weightStackView = UIStackView()
    private let weightTitleLabel = UILabel(alignment: .left)
    private var weightNumberLabel = UILabel(alignment: .right)
    private let weightSlider = UISlider(maxValue: 300)
    
    private let calculateButton = UIButton(isBackgraundWhite: false)
    
    
    // MARK: - Properties
    
    var calculatorBrain = CalculatorBrain()
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setupConstraints()
    }

    // MARK: - Func
    
    @objc private func weightSliderChanged() {
        weightNumberLabel.text = String(format: "%.0f", weightSlider.value) + "kg"
    }
    
    @objc private func heightSliderChanged() {
        heightNumberLabel.text = String(format: "%.2f", heightSlider.value) + "m"
    }
    
    @objc func calculateButtonTapped() {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(weight: weight, height: height)
        
        let resultVC = ResultViewController()
        
        resultVC.modalTransitionStyle = .flipHorizontal
        resultVC.modalPresentationStyle = .fullScreen
        
        resultVC.bmiValue = calculatorBrain.getBMI()
        resultVC.advice = calculatorBrain.getAdvice()
        resultVC.color = calculatorBrain.getColor()
        
        present(resultVC, animated: true)
    }
}

extension CalculateViewController {
    private func setViews() {
        
        heightStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subViews: [heightTitleLabel, heightNumberLabel])
        weightStackView = UIStackView(axis: .horizontal, distribution: .fillEqually, subViews: [weightTitleLabel, weightNumberLabel])
        
        mainStackView = UIStackView(axis: .vertical, distribution: .fillProportionally, subViews: [titleLabel, heightStackView, heightSlider, weightStackView, weightSlider, calculateButton])
        
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
        titleLabel.text = "CALCULATE YOUR BMI"
        heightTitleLabel.text = "Height"
        heightNumberLabel.text = "1.5m"
        
        weightTitleLabel.text = "Weight"
        weightNumberLabel.text = "100kg"
        
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        weightSlider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
        heightSlider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            heightStackView.heightAnchor.constraint(equalToConstant: 21),
            heightSlider.heightAnchor.constraint(equalToConstant: 60),
            weightStackView.heightAnchor.constraint(equalToConstant: 21),
            weightSlider.heightAnchor.constraint(equalToConstant: 60),
            
            calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
}



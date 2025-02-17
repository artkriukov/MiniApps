//
//  CalculateView.swift
//  Tipsy
//
//  Created by Artem Kriukov on 17.02.2025.
//

import UIKit

protocol CalculateViewDelegate: AnyObject {
    func calculateButtonTapped(amount: Double, tipPercentage: Double, peopleCount: Int)
}

class CalculateView: UIView {
    
    // MARK: - Private Properties
    weak var delegate: CalculateViewDelegate?
    private var tip = 0.10
    private var numberOfPeople = 2
    private var billTotal = 0.0
    
    // MARK: - UI
    
    private lazy var billLabel = UILabel(text: "Enter bill total")
    
    private lazy var billTextField: UITextField = {
        let element = UITextField()
        element.attributedPlaceholder = NSAttributedString(
            string: "e.g. 123.56",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        element.textColor = Constants.greenColor
        element.autocapitalizationType = .none
        element.contentMode = .scaleToFill
        element.font = .systemFont(ofSize: 40)
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var greenView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor(red: 215/255, green: 249/255, blue: 235/255, alpha: 1)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var selectTipLabel = UILabel(text: "Select tip")

    private lazy var tipsButtonStack = UIStackView(axis: .horizontal, spacing: 60)
    
    private lazy var zeroPctButton = UIButton(title: "0%")
    private lazy var tenPctButton = UIButton(title: "10%")
    private lazy var twentyPctButton = UIButton(title: "20%")
    
    private lazy var splitLabel = UILabel(text: "Choose Split")
    
    private lazy var splitStackView = UIStackView(axis: .horizontal, spacing: 30)
    
    private lazy var stepperLabel: UILabel = {
        let element = UILabel()
        element.text = "2"
        element.font = .systemFont(ofSize: 35)
        element.textColor = Constants.greenColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var splitStepper: UIStepper = {
        let element = UIStepper()
        element.minimumValue = 2
        element.maximumValue = 25
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var calculateButton = UIButton(title: "Calculate", isActionButton: true)
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        setViews()
        setupConstraints()
        
        zeroPctButton.addTarget(self, action: #selector(choosedPercent), for: .touchUpInside)
        tenPctButton.addTarget(self, action: #selector(choosedPercent), for: .touchUpInside)
        twentyPctButton.addTarget(self, action: #selector(choosedPercent), for: .touchUpInside)
        
        splitStepper.addTarget(self, action: #selector(stepperValueChanged), for: .touchUpInside)
        
        calculateButton.addTarget(self, action: #selector(calculateTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func choosedPercent(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle ?? "0"
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tip = buttonTitleAsANumber / 100
    }
    
    @objc private func stepperValueChanged(_ sender: UIStepper) {
        stepperLabel.text = String(format: "%0.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @objc private func calculateTapped() {
        let amount = Double(billTextField.text ?? "") ?? 0
        let tipPercentage = tip
        let peopleCount = numberOfPeople
        delegate?.calculateButtonTapped(amount: amount, tipPercentage: tipPercentage, peopleCount: peopleCount)
    }
}

private extension CalculateView {
    func setViews() {
        addSubview(billLabel)
        addSubview(billTextField)
        addSubview(greenView)
        
        greenView.addSubview(selectTipLabel)
        greenView.addSubview(tipsButtonStack)
        
        tipsButtonStack.addArrangedSubview(zeroPctButton)
        tipsButtonStack.addArrangedSubview(tenPctButton)
        tipsButtonStack.addArrangedSubview(twentyPctButton)
        
        greenView.addSubview(splitLabel)
        greenView.addSubview(splitStackView)
        
        splitStackView.addArrangedSubview(stepperLabel)
        splitStackView.addArrangedSubview(splitStepper)
        
        greenView.addSubview(calculateButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            billLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            billLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            billTextField.topAnchor.constraint(equalTo: billLabel.bottomAnchor, constant: 10),
            billTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            greenView.topAnchor.constraint(equalTo: billTextField.bottomAnchor, constant: 35),
            greenView.bottomAnchor.constraint(equalTo: bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            selectTipLabel.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 60),
            selectTipLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            tipsButtonStack.topAnchor.constraint(equalTo: selectTipLabel.bottomAnchor, constant: 35),
            tipsButtonStack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            splitLabel.topAnchor.constraint(equalTo: tipsButtonStack.bottomAnchor, constant: 35),
            splitLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            
            splitStackView.topAnchor.constraint(equalTo: splitLabel.bottomAnchor, constant: 45),
            splitStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

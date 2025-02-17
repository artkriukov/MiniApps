//
//  ResultView.swift
//  Tipsy
//
//  Created by Artem Kriukov on 17.02.2025.
//

import UIKit

protocol ResulViewDelegate: AnyObject {
    func resultViewDidTapOnButton(_ resultView: ResultView)
}

class ResultView: UIView {
    
    // MARK: - Private Properties
    weak var delegate: ResulViewDelegate?
    private var numberOfPeople = 2
    private var tipPercentage = 10
    private var totalPerPerson = 0.0
    
    // MARK: - UI
    private lazy var totalLabel: UILabel = {
        let element = UILabel()
        element.text = "Total per person"
        element.textColor = Constants.greyColor
        element.font = .systemFont(ofSize: 30)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var totalBillForBerson: UILabel = {
        let element = UILabel()
        element.text = "0"
        element.font = .systemFont(ofSize: 45)
        element.textColor = Constants.greenColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainView: UIView = {
        let element = UIView()
        element.backgroundColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var infoLabel: UILabel = {
        let element = UILabel()
        element.text = "Split between \(numberOfPeople) people, with \(tipPercentage)% tip."
        element.textColor = Constants.greyColor
        element.font = .systemFont(ofSize: 25)
        element.numberOfLines = 0
        element.textAlignment = .center
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var recalculateButton = UIButton(title: "Recalculate", isActionButton: true)
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(red: 215/255, green: 249/255, blue: 235/255, alpha: 1)
        setViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateWith(totalPerPerson: Double, numberOfPeople: Int, tipPercentage: Int) {
        self.totalPerPerson = totalPerPerson
        self.numberOfPeople = numberOfPeople
        self.tipPercentage = tipPercentage
        
        totalBillForBerson.text = String(format: "%.2f", totalPerPerson)
        infoLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage)% tip."
    }
    
    @objc private func recalculateTapped(_ sender: UIButton) {
        delegate?.resultViewDidTapOnButton(self)
    }

}

private extension ResultView {
    func setViews() {
        addSubview(totalLabel)
        addSubview(totalBillForBerson)
        addSubview(mainView)
        
        mainView.addSubview(infoLabel)
        mainView.addSubview(recalculateButton)
        
        recalculateButton.addTarget(self, action: #selector(recalculateTapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            totalLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 130),
            totalLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            totalBillForBerson.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 35),
            totalBillForBerson.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            mainView.topAnchor.constraint(equalTo: totalBillForBerson.bottomAnchor, constant: 35),
            mainView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 60),
            infoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            infoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -30),
            
            recalculateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            recalculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recalculateButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
}

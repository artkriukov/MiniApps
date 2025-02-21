//
//  CalculateViewController.swift
//  Tipsy
//
//  Created by Artem Kriukov on 17.02.2025.
//

import UIKit

class CalculateViewController: UIViewController {
    
    private let calculateView = CalculateView()
    private let calculateModel = CalculateModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = calculateView
        calculateView.delegate = self
    }
}

extension CalculateViewController: CalculateViewDelegate {
    func calculateButtonTapped(amount: Double, tipPercentage: Double, peopleCount: Int) {
        let totalPerPerson = calculateModel.calculateTotalBill(amount: amount,
                                                               tipPercentage: tipPercentage,
                                                               peopleCount: peopleCount)
        let finalResult = String(format: "%.2f", totalPerPerson)
        
        let resultViewController = ResultViewController()
        resultViewController.totalPerPerson = totalPerPerson
        resultViewController.numberOfPeople = peopleCount
        resultViewController.tipPercentage = Int(tipPercentage * 100)
        self.present(resultViewController, animated: true, completion: nil)
        print("Каждый должен заплатить: \(finalResult)")
    }
    
    
}


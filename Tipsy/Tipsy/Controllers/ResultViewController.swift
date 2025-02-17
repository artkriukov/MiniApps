//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Artem Kriukov on 17.02.2025.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let resultView = ResultView()
    
    var totalPerPerson: Double?
    var numberOfPeople: Int?
    var tipPercentage: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = resultView
        self.restorationIdentifier = "ResultViewController"
        resultView.delegate = self
        
        if let total = totalPerPerson, let people = numberOfPeople, let tip = tipPercentage {
            resultView.updateWith(totalPerPerson: total, numberOfPeople: people, tipPercentage: tip)
        }
    }

}

extension ResultViewController: ResulViewDelegate {
    func resultViewDidTapOnButton(_ resultView: ResultView) {
        dismiss(animated: true)
    }

}

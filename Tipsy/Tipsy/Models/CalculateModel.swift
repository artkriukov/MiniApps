//
//  CalculateModel.swift
//  Tipsy
//
//  Created by Artem Kriukov on 17.02.2025.
//

import Foundation

struct CalculateModel {
    func calculateTotalBill(amount: Double, tipPercentage: Double, peopleCount: Int) -> Double {
        let tipAmount = amount * tipPercentage 
        let total = (amount + tipAmount) / Double(peopleCount)
        return total
    }
}

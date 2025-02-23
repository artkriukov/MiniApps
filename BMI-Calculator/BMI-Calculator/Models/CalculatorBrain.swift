//
//  CalculatorBrain.swift
//  BMI-Calculator
//
//  Created by Artem Kriukov on 23.01.2025.
//

import UIKit

struct CalculatorBrain {
    
    private var bmi: BMI?
    
    mutating func calculateBMI(weight: Float, height: Float) {
        let bmiValue = weight / pow(height, 2)
        switch bmiValue {
        case 0...18.5: bmi = BMI(value: bmiValue, advice: "Eat more pice!", color: .systemBlue)
        case 18.5...24.9: bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .systemGreen)
        default: bmi = BMI(value: bmiValue, advice: "Eat less pice!", color: .red)
        }
    }
    
    func getBMI() -> String {
        return String(format: "%.1f", bmi?.value ?? 0)

    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}

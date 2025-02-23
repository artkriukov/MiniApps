//
//  ViewController.swift
//  Counter
//
//  Created by Artem on 1/2/25.
//

import UIKit

final class CounterViewController: UIViewController {
    @IBOutlet private weak var counterUILabel: UILabel!
    @IBOutlet private weak var incrementUIButton: UIButton!
    @IBOutlet private weak var decrementUIButton: UIButton!
    @IBOutlet private weak var resetUIButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!

    private let counter = Counter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incrementUIButton.layer.cornerRadius = 10
        decrementUIButton.layer.cornerRadius = 10
        resetUIButton.layer.cornerRadius = 10
        
        updateUI()
    }
    
    @IBAction func didTapIncrement() {
        counter.increment()
        updateUI()
    }

    @IBAction func didTapDecrement() {
        counter.decrement()
        updateUI()
    }
    
    @IBAction func didTapReset() {
        counter.reset()
        updateUI()
    }
    
    private func updateUI() {
        counterUILabel.text = "Значение счетчика: \(counter.count)"
        historyTextView.text = counter.history
    }
}


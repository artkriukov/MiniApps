//
//  ViewController.swift
//  ByteCoin
//
//  Created by Artem Kriukov on 20.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let coinView = CoinView()
    private var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = coinView
        
        coinManager.delegate = self
        coinView.currencyPicker.dataSource = self
        coinView.currencyPicker.delegate = self
    }
}

extension ViewController: CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String) {
        
        DispatchQueue.main.async {
            self.coinView.bitcoinLabel.text = price
            self.coinView.currencyLabel.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - UIPickerView DataSource & Delegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
      }
      
      func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return coinManager.currencyArray.count
      }
      
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return coinManager.currencyArray[row]
      }
      
      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          let selectedCurrency = coinManager.currencyArray[row]
          coinManager.getCoinPrice(for: selectedCurrency)
      }
}

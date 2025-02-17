//
//  Extension+WeatherViewController.swift
//  Clima
//
//  Created by Artem Kriukov on 26.01.2025.
//

import UIKit
import CoreLocation

extension WeatherViewController: UITextFieldDelegate {
    // MARK: - Internal Methods
    
    // Для активации кнопки Go на клавиатуре
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true) // скрывает клавиатуру после нажатия на btn search
        return true
    }
    
    internal func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.placeholder != "" {
            return true
        } else {
            searchTextField.placeholder = "Type city"
            return false
        }
    }
    
    internal func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        
        searchTextField.text = ""
    }
}

extension WeatherViewController: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.tempLabel.text = weather.temperatureString
            self.coditionalImageView.image = UIImage(systemName: weather.coditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension WeatherViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(lat: lat, lon:lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}

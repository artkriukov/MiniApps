//
//  WeatherManagerDelegate.swift
//  Clima
//
//  Created by Artem Kriukov on 26.01.2025.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

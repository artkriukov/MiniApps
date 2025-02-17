//
//  WeatherData.swift
//  Clima
//
//  Created by Artem Kriukov on 26.01.2025.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}

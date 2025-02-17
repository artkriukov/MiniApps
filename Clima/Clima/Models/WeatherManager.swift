//
//  WeatherManager.swift
//  Clima
//
//  Created by Artem Kriukov on 26.01.2025.
//
// https://api.openweathermap.org/data/2.5/weather?&appid=fa45ae3447f39fd53492d59113206eab&lat=51&lon=01
import Foundation
import CoreLocation

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    private let url = "https://api.openweathermap.org/data/2.5/weather?&appid=fa45ae3447f39fd53492d59113206eab"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(url)&q=\(cityName)"
        perfomeRequest(urlString: urlString)
    }
    
    func fetchWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) {
        let urlString = "\(url)&lat=\(lat)&lon=\(lon)"
        perfomeRequest(urlString: urlString)
    }
    
    func perfomeRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                }
                
                if let data {
                    if let weather = parseJSON(weatherData: data) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        
        do {
            let decotedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decotedData.weather[0].id
            let temp = decotedData.main.temp
            let name = decotedData.name
            
            let weather = WeatherModel(conditionID: id, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}


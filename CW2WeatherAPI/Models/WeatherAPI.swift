// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation
import SwiftUI

// MARK: - Weather
struct Weather: Codable {
    let coord: Coord
    let weather: [WeatherElement]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

var weather: Weather?
var showWeatherAlert = false

// MARK: - Gets tye JSON data
func getCurrentWeather(url: String, completion: @escaping (Weather)->()) {
    let session = URLSession(configuration: .default)
    session.dataTask(with: URL(string:url)!) {(data, _, err) in
        
        if err != nil {
            print(err!.localizedDescription)
            return
        }
        
        DispatchQueue.main.async {
            do {
                showWeatherAlert = false
                
                weather = try JSONDecoder().decode(Weather.self, from: data!)
                completion(weather!)
            }
            catch {
                showWeatherAlert = true
                print(error)
            }
        }
    }.resume()
}

let apiKey: String = "5aaba0d3defc5483acf08f2a7109b10d"

func setLocationURLString(location: String) -> String {
    if weather?.coord == nil {
        print("NO COORDINATES FOUND ON API")
    }
    return
    "https://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)&units=metric"
}

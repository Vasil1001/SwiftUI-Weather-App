// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let forecastWeather = try? newJSONDecoder().decode(forecastWeather.self, from: jsonData)

import Foundation

// MARK: - forecastWeather
struct forecastWeather: Codable {
    let cod: String
    let message, cnt: Int
    let list: [forecastList]
    let city: forecastCity
}

// MARK: - forecastCity
struct forecastCity: Codable {
    let id: Int
    let name: String
    let coord: forecastCoord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - forecastCoord
struct forecastCoord: Codable {
    let lat, lon: Double
}

// MARK: - forecastList
struct forecastList: Codable, Identifiable {
    let id = UUID()
    let dt: Int
    let main: forecastMainClass
    let weather: [forecastWeatherElement]
    let clouds: forecastClouds
    let wind: forecastWind
    let visibility: Int
    let pop: Double
    let sys: forecastSys
    let dtTxt: String
    let rain: forecastRain?
    
    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - forecastClouds
struct forecastClouds: Codable {
    let all: Int
}

// MARK: - forecastMainClass
struct forecastMainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - forecastRain
struct forecastRain: Codable {
    let the3H: Double
    
    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - forecastSys
struct forecastSys: Codable {
    let pod: forecastPod
}

enum forecastPod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - forecastWeatherElement
struct forecastWeatherElement: Codable {
    let id: Int
    let main: forecastMainEnum
    let weatherDescription: forecastDescription
    let icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum forecastMainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum forecastDescription: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

// MARK: - forecastWind
struct forecastWind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}


let forecastApiKey: String = "5aaba0d3defc5483acf08f2a7109b10d"

func forecastSetLocationURLString(location: String) -> String {
    
    return
    "https://api.openweathermap.org/data/2.5/forecast?q=\(location)&appid=\(forecastApiKey)&units=metric"
}

var forecast3HSegments: forecastWeather?

func get3HSegmentsForecast(url: String?, completion: @escaping ([forecastList])->()) {
    print("1")
    
    let session = URLSession(configuration: .default)
    session.dataTask(with: URL(string:url ?? "https://api.openweathermap.org/data/2.5/forecast?q=London&appid=5aaba0d3defc5483acf08f2a7109b10d&units=metric")!) {(data, _, err) in
        
        if err != nil {
            print("2")
            print(err!.localizedDescription)
            return
        }
        
        DispatchQueue.main.async {
            do {
                print("3")
                forecast3HSegments = try JSONDecoder().decode(forecastWeather.self, from: data!)
                print("4")
                completion(forecast3HSegments?.list ?? [])
                print(forecast3HSegments?.list ?? [])
                print("5")
            }
            catch {
                print("6 - ERROR")
                print(error)
            }
        }//
    }.resume()
}

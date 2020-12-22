import Foundation

struct CurrentWeatherForecastResponse: Decodable {
    let coord: Coord
    let main: Main
    let name: String
    let weather: [Weather]
    let sys: Sys
    let wind: Wind
    let dt: Double
    
    struct Main: Codable {
        let temperature: Double
        let humidity: Double
        let maxTemperature: Double
        let minTemperature: Double
        let feelsLike: Double
        let pressure: Double
        
        enum CodingKeys: String, CodingKey {
            case temperature = "temp"
            case humidity
            case maxTemperature = "temp_max"
            case minTemperature = "temp_min"
            case feelsLike = "feels_like"
            case pressure
        }
    }
    
    struct Coord: Codable {
        let lon: Double
        let lat: Double
    }
}

struct Weather: Decodable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case weatherDescription = "description"
        case icon = "icon"
    }
}

struct Sys: Decodable {
    let type: Double
    let id: Double
    let country: String
    let sunrise: Double
    let sunset: Double

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case id = "id"
        case country = "country"
        case sunrise = "sunrise"
        case sunset = "sunset"
    }
}

struct Wind: Decodable {
    let speed: Double
    let deg: Double

    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
}

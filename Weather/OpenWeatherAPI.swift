//
//  OpenWeatherAPIController.swift
//  Wheather.
//
//  Created by Федор on 30/08/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import Foundation

struct OpenWeatherAPI {
    
    private static let baseWeatherURLString = "http://api.openweathermap.org/data/2.5/weather"
    private static let baseForecastURLString = "http://api.openweathermap.org/data/2.5/forecast"
    private static let apiKey = "646dfb938a66b562fe9b2d771716d7fc"
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    enum WheaterError: Error {
        case invalidJSONData
    }
    
    static func openWeatherURL(cityId: String, parameters:[String:String]?) -> (URL, URL) {
        
        var componentsWeather = URLComponents(string: baseWeatherURLString)!
        var componentsForecast = URLComponents(string: baseForecastURLString)!
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "id": cityId,
            "units": "metric",
            "APPID": apiKey
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let params = parameters {
            for (key, value) in params {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        componentsForecast.queryItems = queryItems
        componentsWeather.queryItems = queryItems
        return (componentsForecast.url!, componentsWeather.url!)
    }
    
    static func info(fromJSON data: Data) -> RequestResult {
        do {
            var finalWeatherInfo = [Weather]()
            let parsedResult: ResponseParser = try JSONDecoder().decode(ResponseParser.self, from: data)
            for (index, _) in parsedResult.list.enumerated() {
                finalWeatherInfo.append(Weather(temp: parsedResult.list[index].main!.temp!, pressure: parsedResult.list[index].main!.pressure!, humidity: parsedResult.list[index].main!.humidity!, id: parsedResult.city.id!, name: parsedResult.city.name!, description: parsedResult.list[index].weather[0].description!, windSpeed: nil, dataTaken: dateFormatter.date(from: parsedResult.list[index].dt_txt)))
            }
            print(parsedResult.list[0].main!.temp!, parsedResult.list[0].weather[0].description!, parsedResult.city.id!, parsedResult.city.name!, dateFormatter.date(from: parsedResult.list[0].dt_txt)!)
            return .success(finalWeatherInfo)
        } catch let error {
            return .error(error)
        }
    }
    
}





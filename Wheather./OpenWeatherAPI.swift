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
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            var finalWeatherInfo = [Wheather]()
//            print(jsonObject)
            guard
                let jsonDictionary = jsonObject as? [AnyHashable: Any],
                let wheatherList = jsonDictionary["list"] as? [String: Any],
                let mainWheather = wheatherList["main"] as? [[String: Any]]
            else {
//                Wrong JSON parsing
                    return .error(WheaterError.invalidJSONData)
            }
            print(mainWheather)
            for wheatherInfo in mainWheather {
                if let wheather = mainWheatherParsing(fromJSON: wheatherInfo){
                    finalWeatherInfo.append(wheather)
                }
            }
            
            if finalWeatherInfo.isEmpty && !mainWheather.isEmpty {
                return .error(WheaterError.invalidJSONData)
            }
            
            return .success(finalWeatherInfo)
        } catch let error {
            return .error(error)
        }
    }
    
    private static func mainWheatherParsing(fromJSON mainJson: [String: Any?]) -> Wheather? {
        guard
            let temp = mainJson["temp"] as? String, // MAYBE AN ERROR
            let pressure = mainJson["pressure"] as? Double,
            let humidity = mainJson["humidity"] as? Double
        else {
            return nil
        }
        return Wheather(temp: temp, pressure: pressure, humidity: humidity, description: nil, windSpeed: nil, dataTaken: nil)
    }
}





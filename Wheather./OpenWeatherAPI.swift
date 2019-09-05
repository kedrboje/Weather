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
//        print(componentsForecast.url!)
        return (componentsForecast.url!, componentsWeather.url!)
    }
}





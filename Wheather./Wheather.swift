//
//  Wheather.swift
//  Wheather.
//
//  Created by Федор on 08/09/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import Foundation

class Wheather {
    let temp: String
    let pressure: Double
    let humidity: Double
    let description: String?
    let windSpeed: Double?
    let dataTaken: Date?
    
    init(temp: String, pressure: Double, humidity: Double, description: String?, windSpeed: Double?, dataTaken: Date?){
        self.temp = temp
        self.pressure = pressure
        self.humidity = humidity
        self.description = description
        self.windSpeed = windSpeed
        self.dataTaken = dataTaken
    }
    
}

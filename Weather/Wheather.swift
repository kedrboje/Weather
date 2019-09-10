//
//  Wheather.swift
//  Wheather.
//
//  Created by Федор on 08/09/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import Foundation

class Wheather {
    let temp: Double
    let pressure: Double
    let humidity: Double
    let id: Int?
    let name: String?
    let description: String?
    let windSpeed: Double?
    let dataTaken: Date?
    
    init(temp: Double, pressure: Double, humidity: Double, id: Int?, name: String?, description: String?, windSpeed: Double?, dataTaken: Date?){
        self.temp = temp
        self.pressure = pressure
        self.humidity = humidity
        self.id = id
        self.name = name
        self.description = description
        self.windSpeed = windSpeed
        self.dataTaken = dataTaken
    }
    
}

//
//  ResponseParser.swift
//  Wheather.
//
//  Created by Федор on 09/09/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import Foundation

struct ResponseParser: Decodable{
    enum CodingKeys: String, CodingKey {
        case list
        case city
    }
    let list: [List]
    let city: City
}

struct City: Decodable {
    var id: Int?
    var name: String?
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try! container.decode(Int.self, forKey: .id)
        self.name = try! container.decode(String.self, forKey: .name)
    }
}

struct List: Decodable {
    var dt_txt: String
    let main: ParsedMainDict?
    let weather: [ParsedWeather]  // I have no idea why "wheather" object is an array with one element, but it is. OpenWeather - it's on your mind.
    enum CodingKeys: String, CodingKey {
        case dt_txt
        case main
        case weather
    }
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.dt_txt = try! container.decode(String.self, forKey: .dt_txt)
            self.main = try! container.decode(ParsedMainDict.self, forKey: .main)
            self.weather = try! container.decode([ParsedWeather].self, forKey: .weather)
        }
}

struct ParsedWeather: Decodable {
    var description: String?
    enum CodingKeys: String, CodingKey {
        case description
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try! container.decode(String.self, forKey: .description)
    }
}

struct ParsedMainDict: Decodable {
    var humidity: Double?
    var pressure: Double?
    var temp: Double?
    
    enum CodingKeys: String, CodingKey {
        case humidity
        case pressure
        case temp
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.humidity = try! container.decode(Double.self, forKey: .humidity)
        self.pressure = try! container.decode(Double.self, forKey: .pressure)
        self.temp = try! container.decode(Double.self, forKey: .temp)
    }
}

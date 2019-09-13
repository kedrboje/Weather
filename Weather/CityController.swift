//
//  CityController.swift
//  Weather
//
//  Created by Федор on 12/09/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import Foundation


class CityController {
    
    var city: City!
    
    struct City {
        var name: String
        var id: Int?
        
        init(name: String, id: Int?) {
            self.name = name
            if let cityId = id {
                self.id = cityId
            }
        }
    }
    
    init(city: City){
        self.city = city
    }
    
}

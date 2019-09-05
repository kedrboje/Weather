//
//  WheatherInfo.swift
//  Wheather.
//
//  Created by Федор on 31/08/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import Foundation

class WheatherInfo {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func getData() {
        
        let (url, _) = OpenWeatherAPI.openWeatherURL(cityId: "498817", parameters: nil)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print(jsonString)
                }
            } else if let _ = error {
                print("request error")
            } else {
                print("Unexpected error")
            }
        }
        task.resume()
        
    }
    
}

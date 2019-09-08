//
//  WheatherInfo.swift
//  Wheather.
//
//  Created by Федор on 31/08/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import Foundation

enum RequestResult {
    case success([Wheather])
    case error(Error)
}

class WheatherInfo {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    func getData(completion: @escaping (RequestResult) -> Void) {
        
        let (url, _) = OpenWeatherAPI.openWeatherURL(cityId: "498817", parameters: nil)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
//            if let jsonData = data {
//                do {
//                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
//                    print(jsonObject)
//                } catch let jsonError {
//                    print("Error creatin JSON Object: \(jsonError)")
//                }
//            } else if let requestError = error {
//                print("request error: \(requestError)")
//            } else {
//                print("Unexpected error")
//            }
            let result = self.processWheatherRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
        
    }
    
    private func processWheatherRequest(data: Data?, error: Error?) -> RequestResult {
        guard let jsonData = data else { return .error(error!) }
        return OpenWeatherAPI.info(fromJSON: jsonData)
    }
    
}

//
//  WheatherInfo.swift
//  Wheather.
//
//  Created by Федор on 31/08/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import Foundation

enum RequestResult {
    case success([Weather])
    case error(Error)
}

class WeatherSession {
    
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    let params: [String:String]?
    
    init(params: [String:String]?) {
        if let parameters = params {
            self.params = parameters
        } else {
            self.params = nil
        }
    }
    
    func getData(completion: @escaping (RequestResult) -> Void) {
        
        let (url, _) = OpenWeatherAPI.openWeatherURL(cityId: nil, parameters: params)
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            let result = self.processWeatherRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
        
    }
    
    private func processWeatherRequest(data: Data?, error: Error?) -> RequestResult {
        guard let jsonData = data else { return .error(error!) }
        return OpenWeatherAPI.info(fromJSON: jsonData)
    }
    
}

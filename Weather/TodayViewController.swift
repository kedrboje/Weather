//
//  TodayViewController.swift
//  Wheather.
//
//  Created by Федор on 30/08/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
    
    var store = WheatherSession()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.getData {
            (requestResult) -> Void in
            
            switch requestResult {
            case let .success(weather):
                DispatchQueue.main.async {
                    print("Successfully found \(weather.count) wheather.")
                    self.currentCityLabel.text = weather[0].name!
                    self.currentTemp.text = "+\(weather[0].temp)"
                    self.currentHumidity.text = "Humidity: \(weather[0].humidity)"
                    self.currentPressure.text = "Pressure: \(weather[0].pressure)"
                    self.currentWheatherDescription.text = weather[0].description!
                    self.atTheTime.text = "\(self.dateFormatter.string(from: weather[0].dataTaken!))"
                }
            case let .error(err):
                print("Error fetching wheather: \(err)")
            }
        }
    }
    
    @IBAction func tapToChangeCity(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet var currentCityLabel: UILabel!
    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var currentHumidity: UILabel!
    @IBOutlet var currentPressure: UILabel!
    @IBOutlet var currentWheatherDescription: UILabel!
    @IBOutlet var atTheTime: UILabel!
    
}

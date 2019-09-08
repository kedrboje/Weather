//
//  TodayViewController.swift
//  Wheather.
//
//  Created by Федор on 30/08/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
    
    var store = WheatherInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.getData {
            (requestResult) -> Void in
            
            switch requestResult {
            case let .success(weather):
                print("Successfully found \(weather.count) wheather.")
            case let .error(err):
                print("Error fetching wheather: \(err)")
            }
        }
    }
    
    @IBAction func tapToChangeCity(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

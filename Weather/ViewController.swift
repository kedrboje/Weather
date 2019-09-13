//
//  ViewController.swift
//  Wheather.
//
//  Created by Федор on 30/08/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textAlert = UIAlertController(title: "Attention", message: "Please, enter the correct city name you looking for!", preferredStyle: .alert)
    var okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    
    @IBOutlet var textField: UITextField!
    
    var city: CityController.City!
    
    @IBAction func tapToHideKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    @IBAction func letsGoButtonPressed(_ sender: UIButton) {
        if !textFieldIsCorrect(textfield: textField.text!) {
            present(textAlert, animated: true, completion: nil)
        }
        city = CityController.City(name: textField.text!, id: nil)
    }
    
    override func viewDidLoad() {
        textAlert.addAction(okAction)
        super.viewDidLoad()
    }
    
    private func textFieldIsCorrect(textfield text: String) -> Bool {
        if text == "" {return false}
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let todayViewController = segue.destination as? TodayViewController {
            todayViewController.cityController = CityController(city: city)
            todayViewController.store = WeatherSession(params: ["q":todayViewController.cityController.city.name])
            print(city.name)
        }
    }
    
}


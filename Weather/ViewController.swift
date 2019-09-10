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
    
    @IBAction func tapToHideKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    @IBAction func letsGoButtonPressed(_ sender: UIButton) {
        if textField.text == "" {
            print("There is no city!")
            present(textAlert, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        textAlert.addAction(okAction)
        super.viewDidLoad()
    }
    
}


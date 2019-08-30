//
//  ViewController.swift
//  Wheather.
//
//  Created by Федор on 30/08/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    
    @IBAction func tapToHideKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    @IBAction func letsGoButtonPressed(_ sender: UIButton) {
        print("There is no city!")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


//
//  TodayViewController.swift
//  Wheather.
//
//  Created by Федор on 30/08/2019.
//  Copyright © 2019 Федор. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapToChangeCity(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

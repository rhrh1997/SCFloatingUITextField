//
//  ViewController.swift
//  FlatDesignElements
//
//  Created by RAZA on 4/11/17.
//  Copyright © 2017 RAZA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var userView: UIFloatingFieldView!
    var underLine:CAShapeLayer?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGray

    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    


    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}



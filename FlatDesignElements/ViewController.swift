//
//  ViewController.swift
//  FlatDesignElements
//
//  Created by RAZA on 4/11/17.
//  Copyright © 2017 RAZA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    var underLine:CAShapeLayer?
    
    override func viewDidLoad() {

        super.viewDidLoad()
        changePlaceholder()
        self.view.backgroundColor = UIColor.darkGray
        let field_x = field.frame.origin.x - 30
        let field_y = field.frame.origin.y
        let field_end = field_y + field.frame.height + 5
        let field_size = field.frame.width

        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x:field_x, y:field_end))
        linePath.addLine(to: CGPoint(x:field_x + field_size, y:field_end))
        line.path = linePath.cgPath
        line.strokeColor = UIColor.white.cgColor
        line.lineWidth = 1
        line.lineJoin = kCALineJoinRound
        underLine = line
        self.view.layer.addSublayer(underLine!)
        field.addTarget(self, action:#selector(ViewController.fieldShow), for: UIControlEvents.touchDown)
        field.addTarget(self, action:#selector(ViewController.fieldHide), for: .editingDidEnd)
    }
    
    func changePlaceholder()
    {
        var placeHolder = NSMutableAttributedString()
        let Name  = "Hello"

        // Set the Font
        placeHolder = NSMutableAttributedString(string:Name, attributes: [NSFontAttributeName:UIFont(name: "Helvetica", size: 15.0)!])
        
        // Set the color
        placeHolder.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range:NSRange(location:0,length:Name.characters.count))
        
        // Add attribute
        field.attributedPlaceholder = placeHolder
        
    }
    
    func fieldShow()
    {
        let animationDuration = 0.7
        CATransaction.begin()
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
        self.underLine?.lineWidth = 2
        CATransaction.commit()
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut
            , animations: {
                self.field.alpha = 1.0
        }
            , completion:nil
        )
        
    }
    
    func fieldHide()
    {
        let animationDuration = 0.7
        CATransaction.begin()
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
        self.underLine?.lineWidth = 1
        CATransaction.commit()
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut
            , animations: {
                self.field.alpha = 1.0
        }
            , completion:nil
        )
    }

    @IBAction func fieldTouched(_ sender: Any) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


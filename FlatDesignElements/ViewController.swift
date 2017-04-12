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
        self.view.backgroundColor = UIColor.darkGray

        field.addTarget(self, action:#selector(fieldShow(_:)), for: UIControlEvents.touchDown)
        field.addTarget(self, action:#selector(fieldHide(_:)), for: .editingDidEnd)
        let image = UIImage(named: "007-user")
        underLine = self.setupField(_field: field, fieldImage: image!)
        self.view.layer.addSublayer(underLine!)
        changePlaceholder()

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
    
    func fieldShow(_ sender:UITextField)
    {
        let animationDuration = 0.7
        CATransaction.begin()
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
        self.underLine?.lineWidth = 2
        CATransaction.commit()
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut
            , animations: {
                sender.alpha = 1.0
        }
            , completion:nil
        )
        
    }
    
    func fieldHide(_ sender:UITextField)
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

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) //This will hide the keyboard
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension UIViewController {
    
    func setupField(_field: UITextField, fieldImage: UIImage) -> CAShapeLayer
    {
        let fieldImage = fieldImage
        let field_x = _field.frame.origin.x
        let field_y = _field.frame.origin.y
        let field_end = field_y + _field.frame.height + 5
        let field_size = _field.frame.width
        
        //Add Image
        let vwContainer = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 25))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        let image = fieldImage
        imageView.image = image
        vwContainer.addSubview(imageView)
        _field.leftViewMode = UITextFieldViewMode.always
        _field.leftView = vwContainer
    
        //Add Line
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x:field_x, y:field_end))
        linePath.addLine(to: CGPoint(x:field_x + field_size, y:field_end))
        line.path = linePath.cgPath
        line.strokeColor = UIColor.white.cgColor
        line.lineWidth = 1
        line.lineJoin = kCALineJoinRound
        return line
    }
    
    
}


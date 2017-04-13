//
//  UIFloatingFieldView.swift
//  FlatDesignElements
//
//  Created by RAZA on 4/12/17.
//  Copyright © 2017 RAZA. All rights reserved.
//

import UIKit

class UIFloatingFieldView: UITextField, UITextFieldDelegate {
    
    var underline:CAShapeLayer?
    var placeholderText:String?
    
    override init (frame : CGRect)
    {
        super.init(frame : frame)
        delegate = self
        commonInit()
        
    }
    
    func setPlaceholder(text: String)
    {
        placeholderText = text
        self.placeholder = placeholderText
    }
    
    func commonInit()
    {
        self.borderStyle = UITextBorderStyle.none
        self.addTarget(self, action:#selector(fieldShow(_:)), for: UIControlEvents.touchDown)
        self.addTarget(self, action:#selector(fieldHide(_:)), for: .editingDidEnd)
        let image = UIImage(named: "007-user")
        setupField(fieldImage: image!)
        changePlaceholder()
    }
    
    func setupField(fieldImage: UIImage)
    {
        let fieldImage = fieldImage
        let field_x = CGFloat(0)
        let field_y = CGFloat(0)
        let field_end = field_y + self.frame.height + 5
        let field_size = self.frame.width
        
        //Add Image
        let vwContainer = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 25))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        let image = fieldImage
        imageView.image = image
        vwContainer.addSubview(imageView)
        self.leftViewMode = UITextFieldViewMode.always
        self.leftView = vwContainer
        
        //Add Line
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x:field_x, y:field_end))
        linePath.addLine(to: CGPoint(x:field_x + field_size, y:field_end))
        line.path = linePath.cgPath
        line.strokeColor = UIColor.white.cgColor
        line.lineWidth = 1
        line.lineJoin = kCALineJoinRound
        underline = line
        self.layer.addSublayer(underline!)

    }
    
    
    func changePlaceholder()
    {
        var placeHolder = NSMutableAttributedString()
        
        if(placeholderText == nil)
        {
            placeholderText = ""
        }
        
        // Set the Font
        placeHolder = NSMutableAttributedString(string:placeholderText!, attributes: [NSFontAttributeName:UIFont(name: "Helvetica", size: 15.0)!])
        
        // Set the color
        placeHolder.addAttribute(NSForegroundColorAttributeName, value: UIColor.white, range:NSRange(location:0,length:placeholderText!.characters.count))
        
        // Add attribute
        self.attributedPlaceholder = placeHolder
        
    }
    
    func fieldShow(_ sender:UITextField)
    {
        let animationDuration = 0.7
        CATransaction.begin()
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut))
        self.underline?.lineWidth = 2
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
        self.underline?.lineWidth = 1
        CATransaction.commit()
        UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseOut
            , animations: {
                sender.alpha = 1.0
        }
            , completion:nil
        )
    }
    
    

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
